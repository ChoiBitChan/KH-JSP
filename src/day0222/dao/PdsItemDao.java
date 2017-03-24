package day0222.dao;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import day0222.connection.ConnectionProvider;
import day0222.jdbc.JdbcUtil;
import day0222.model.PdsItem;

public class PdsItemDao {

	private static PdsItemDao instance = new PdsItemDao();		// new 연산자는 메모리 할당 => 주소값 받는다, 인스턴스를 메모리에 올린다 => 생성자 호출
	
	public static PdsItemDao getInstance() {
		return instance;
	}
	
	private PdsItemDao() {
		
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(
					"select count(*) from pds_item"
					);
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	public List<PdsItem> select(Connection conn, int firstRow, int endRow) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(
					"select * from ( "+
					"select rownum rnum, pds_item_id, filename, realpath, filesize, downloadcount, description from ( "+
					"select * from pds_item m order by m.pds_item_id desc "+
					") where rownum <= ? "+
					") where rnum >= ?"
					);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);
			rs = pstmt.executeQuery();
			
			if (!rs.next()) {
				// 꺼내온 리스트가 하나도 없으면 비어있는 리스트 return
				return Collections.emptyList();
			}
			List<PdsItem> itemList = new ArrayList<PdsItem>();
			do {
				PdsItem article = makeItemFromResultSet(rs);
				itemList.add(article);
			} while (rs.next());
			return itemList;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	private PdsItem makeItemFromResultSet(ResultSet rs) throws SQLException {
		
		PdsItem item = new PdsItem();
		item.setId(rs.getInt("pds_item_id"));
		item.setFileName(rs.getString("filename"));
		item.setRealPath(rs.getString("realpath"));
		item.setFileSize(rs.getLong("filesize"));
		item.setDownloadCount(rs.getInt("downloadcount"));
		item.setDescription(rs.getString("description"));
		return item;
		
	}
	
	public PdsItem selectById(Connection conn, int itemId) throws SQLException {
		System.out.println("selecetById : "+itemId);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			pstmt = conn.prepareStatement("select * from pds_item "
					+ "where pds_item_id = ?");
			pstmt.setInt(1, itemId);
			rs = pstmt.executeQuery();
			
			if (!rs.next()) {
				return null;
			}
			
			PdsItem item = makeItemFromResultSet(rs);
			return item;
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int insert(Connection conn, PdsItem item) throws SQLException {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(
					"insert into pds_item"
					+"(pds_item_id, filename, realpath, filesize, downloadcount, "
					+"description)"
					+"values (pds_item_id_seq.NEXTVAL, ?, ?, ?, 0, ?)"
					);
			pstmt.setString(1, item.getFileName());
			pstmt.setString(2, item.getRealPath());
			pstmt.setLong(3, item.getFileSize());
			pstmt.setString(4, item.getDescription());
			int insertedCount = pstmt.executeUpdate();
			
			if (insertedCount > 0) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(
						"select pds_item_id_seq.CURRVAL from dual"
						);
				if (rs.next()) {
					return rs.getInt(1);
				}
			}
			return -1;
		} finally {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (pstmt != null) pstmt.close();
		}
	}
	
	public int increaseCount(Connection conn, int id) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update pds_item set downloadcount = downloadcount + 1 where pds_item_id = ?");
			pstmt.setInt(1, id);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	public int delete(String deleteItemId) throws SQLException {
		int resultNum = -1;
		Connection conn = ConnectionProvider.getConnection();
		
		PreparedStatement pstmt = null;
		PdsItem item = null;
		
		item = selectById(conn, Integer.parseInt(deleteItemId));
		
		File file = new File(item.getRealPath());
		
		boolean delCheck = file.delete();
		
		if (delCheck) {
			try {
				pstmt = conn.prepareStatement(
						"delete from pds_item where pds_item_id = ?"
						);
				pstmt.setInt(1, Integer.parseInt(deleteItemId));
				resultNum = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("resultNum : " + resultNum);
				return resultNum;
			} finally {
				JdbcUtil.close(pstmt);
				JdbcUtil.close(conn);
			}
		}
		System.out.println("resultNum : " + resultNum);
		return resultNum;
	}
}

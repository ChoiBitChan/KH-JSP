package day0214_board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CommentDBBean {
	
	private static CommentDBBean instance = new CommentDBBean();
	
	public static CommentDBBean getInstance() {
		return instance;
	}
	
	private CommentDBBean(){}
	
	private Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	}
	
	public void insertComment(CommentDataBean cdb) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = "insert into reply_comment values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cdb.getContent_num());
			pstmt.setString(2, cdb.getCommenter());
			pstmt.setString(3, cdb.getCommentt());
			pstmt.setString(4, cdb.getPasswd());
			pstmt.setTimestamp(5, cdb.getReg_date());
			pstmt.setString(6, cdb.getIp());
			pstmt.setInt(7, cdb.getComment_num());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}
	
	public ArrayList getComments(int con_num, int start, int end)throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList cm=null;
		try{
			conn=getConnection();
			String sql="select content_num,commenter,commentt,reg_date,ip,comment_num,r "
					+ "from (select content_num,commenter,commentt,reg_date,ip,comment_num, rownum r "
					+ "from (select content_num,commenter,commentt,reg_date,ip,comment_num "
					+ "from reply_comment where content_num="+con_num+" order by reg_date desc) order by reg_date desc) where r >= ? and r <= ?";			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				cm=new ArrayList();
				do{
					CommentDataBean cdb=new CommentDataBean();
					cdb.setComment_num(rs.getInt("comment_num"));
					cdb.setContent_num(rs.getInt("content_num"));
					cdb.setCommenter(rs.getString("commenter"));
					cdb.setCommentt(rs.getString("commentt"));
					cdb.setIp(rs.getString("ip"));
					cdb.setReg_date(rs.getTimestamp("reg_date"));
					cm.add(cdb);
				}while(rs.next());
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return cm;
	}
	
	public int getCommentCount(int con_num)throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList cm=null;
		int count=0;
		
		try{
			conn=getConnection();
			// count�� ����ص� ��
			String sql="select * from reply_comment where content_num="+con_num+" order by reg_date desc";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				cm=new ArrayList();
				do{
					CommentDataBean cdb=new CommentDataBean();
					cdb.setCommenter(rs.getString("commenter"));
					cdb.setCommentt(rs.getString("commentt"));
					cdb.setIp(rs.getString("ip"));
					cdb.setReg_date(rs.getTimestamp("reg_date"));
					cm.add(cdb);
				}while(rs.next());
				count=cm.size();
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return count;
	}
	
	public int deleteComment(int content_num,String passwd,int comment_num)throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String dbpasswd="";
		int x=-1;
		
		try{
			conn=getConnection();
			pstmt=conn.prepareStatement("select passwd from reply_comment where content_num=? and comment_num=?");
			pstmt.setInt(1, content_num);
			pstmt.setInt(2, comment_num);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dbpasswd=rs.getString("passwd");
				if(dbpasswd.equals(passwd)){
					pstmt=conn.prepareStatement("delete from reply_comment where content_num=? and comment_num=?");
					pstmt.setInt(1, content_num);
					pstmt.setInt(2, comment_num);
					pstmt.executeUpdate();
					x=1;
				}else
					x=0;
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return x;
	}
	
}

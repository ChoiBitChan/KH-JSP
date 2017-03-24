package day0214_board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDBBean {
	
	private static BoardDBBean instance = new BoardDBBean();
	
	public static BoardDBBean getInstance() {
		return instance;
	}
	
	public BoardDBBean() {
		// TODO Auto-generated constructor stub
	}
	
	private Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	}
	
	public void insertArticle(BoardDataBean article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = article.getNum();
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		int number = 0;
		String sql = "";
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select max(num) from reply_board");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}
			
			if (num != 0) {
				sql = "update reply_board set re_step = re_step + 1 where ref = ? and re_step > ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				re_step = re_step + 1;
				re_level = re_level + 1;
			} else {
				ref = number;
				re_step = 0;
				re_level = 0;
			}
			
			sql = "insert into reply_board (num, writer, email, subject, passwd, reg_date,";
			sql += "ref, re_step, re_level, content, ip) values (reply_board_num.NEXTVAL, ?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPasswd());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());
			
			pstmt.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}
	
	public int getArticleCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select count(*) from reply_board");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return x;
	}
	
	public int getArticleCount(int n, String searchKeyword) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String[] column_name = {"writer","subject","content"};
		
		int x = 0;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select count(*) from reply_board where "+column_name[n]+" like '%"+searchKeyword+"%'");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return x;
	}	
	
	public List getArticles(int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,r  " +
				            "from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r " +
				            "from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount " +
				            "from reply_board order by ref desc, re_step asc) order by ref desc, re_step asc ) where r >= ? and r <= ? "
					);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				articleList = new ArrayList(end);
				do {
					BoardDataBean article = new BoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
	                article.setSubject(rs.getString("subject"));
	                article.setPasswd(rs.getString("passwd"));
	                article.setReg_date(rs.getTimestamp("reg_date"));
	                article.setReadcount(rs.getInt("readcount"));
	                article.setRef(rs.getInt("ref"));
	                article.setRe_step(rs.getInt("re_step"));
	                article.setRe_level(rs.getInt("re_level"));
	                article.setContent(rs.getString("content"));
	                article.setIp(rs.getString("ip"));
	                
	                articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return articleList;
	}
	
	public List getArticles(int start, int end, int n, String searchKeyword) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		
		String[] column_name = {"writer","subject","content"};
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,r  " +
				            "from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r " +
				            "from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount " +
				            "from reply_board order by ref desc, re_step asc) where "+column_name[n]+" like '%"+searchKeyword+"%' order by ref desc, re_step asc ) where r >= ? and r <= ? "
					);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				articleList = new ArrayList(end);
				do {
					BoardDataBean article = new BoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
	                article.setSubject(rs.getString("subject"));
	                article.setPasswd(rs.getString("passwd"));
	                article.setReg_date(rs.getTimestamp("reg_date"));
	                article.setReadcount(rs.getInt("readcount"));
	                article.setRef(rs.getInt("ref"));
	                article.setRe_step(rs.getInt("re_step"));
	                article.setRe_level(rs.getInt("re_level"));
	                article.setContent(rs.getString("content"));
	                article.setIp(rs.getString("ip"));
	                
	                articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return articleList;
	}
	
	public BoardDataBean getArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDataBean article = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"update reply_board set readcount = readcount + 1 where num = ?"
					);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(
					"select * from reply_board where num = ?"
					);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
                article.setEmail(rs.getString("email"));
                article.setSubject(rs.getString("subject"));
                article.setPasswd(rs.getString("passwd"));
                article.setReg_date(rs.getTimestamp("reg_date"));
                article.setReadcount(rs.getInt("readcount"));
                article.setRef(rs.getInt("ref"));
                article.setRe_step(rs.getInt("re_step"));
                article.setRe_level(rs.getInt("re_level"));
                article.setContent(rs.getString("content"));
                article.setIp(rs.getString("ip"));  
			}
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return article;
	}
	
	public BoardDataBean updateGetArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDataBean article = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from reply_board where num = ?"
					);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				article = new BoardDataBean();
                article.setNum(rs.getInt("num"));
                article.setWriter(rs.getString("writer"));
                article.setEmail(rs.getString("email"));
                article.setSubject(rs.getString("subject"));
                article.setPasswd(rs.getString("passwd"));
                article.setReg_date(rs.getTimestamp("reg_date"));
                article.setReadcount(rs.getInt("readcount"));
                article.setRef(rs.getInt("ref"));
                article.setRe_step(rs.getInt("re_step"));
                article.setRe_level(rs.getInt("re_level"));
                article.setContent(rs.getString("content"));
                article.setIp(rs.getString("ip"));  
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return article;
	}
	
	public int updateArticle(BoardDataBean article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbpasswd = "";
		String sql = "";
		int x = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select passwd from reply_board where num = ?"
					);
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dbpasswd = rs.getString("passwd");
				System.out.println(dbpasswd);
				if(dbpasswd.equals(article.getPasswd())) {
					sql = "update reply_board set writer = ?, email = ?, subject = ?, passwd = ?";
					sql += ", content = ? where num = ?";
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, article.getWriter());
					pstmt.setString(2, article.getEmail());
					pstmt.setString(3, article.getSubject());
	                pstmt.setString(4, article.getPasswd());
	                pstmt.setString(5, article.getContent());
	                pstmt.setInt(6, article.getNum());
	                pstmt.executeUpdate();
	                
	                x = 1;
				} else {
					x = 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null ) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return x;
	}
	
	public int deleteArticle(int num, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select passwd from reply_board where num = ?"
					);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dbpasswd = rs.getString("passwd");
				if (dbpasswd.equals(passwd)) {
					pstmt = conn.prepareStatement(
							"delete from reply_board where num = ?"
							);
					pstmt.setInt(1, num);
					pstmt.executeQuery();
					x = 1;
				} else {
					x = 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return x;
	}
	
}
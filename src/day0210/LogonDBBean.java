package day0210;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class LogonDBBean {

	private static LogonDBBean instance = new LogonDBBean();
	
	public static LogonDBBean getInstance() {
		return instance;
	}
	
	private LogonDBBean() {
	}
	
	private Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		
		return DriverManager.getConnection(jdbcDriver);
	}
	
	public void insertMember(LogonDataBean member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("insert into zipcode_member values (?,?,?,?,?,?,?,?,?,?)");
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getJumin1());
			pstmt.setString(5, member.getJumin2());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getBlog());
			pstmt.setTimestamp(8, member.getReg_date());
			pstmt.setString(9, member.getZipcode());
			pstmt.setString(10, member.getAddress());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}
	
	public int userCheck(String id, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select passwd from zipcode_member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dbpasswd = rs.getString("passwd");
				if (dbpasswd.equals(passwd)) {
					x = 1;	//인증성공
				} else {
					x = 0;	//비밀번호 틀림
				}
			} else {
				x = -1;	//해당 아이디 없음
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
	
	public int confirmId(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select id form zipcode_member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				x = 1;	//해당 아이디 있음
			} else {
				x = -1; //해당 아이디 없음
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
	
	public LogonDataBean getMember(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LogonDataBean member = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select * from zipcode_member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				member = new LogonDataBean();
				
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setJumin1(rs.getString("jumin1"));
				member.setJumin2(rs.getString("jumin2"));
				member.setEmail(rs.getString("email"));
				member.setBlog(rs.getString("blog"));
				member.setZipcode(rs.getString("zipcode"));
				member.setAddress(rs.getString("address"));
				member.setReg_date(rs.getTimestamp("reg_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return member;
	}
	
	public void updateMember(LogonDataBean member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("update zipcode_member set passwd = ?, name = ?, email = ?, blog = ?, zipcode = ?, address = ?" + "where id = ?");
			pstmt.setString(1, member.getPasswd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getBlog());
			pstmt.setString(5, member.getZipcode());
			pstmt.setString(6, member.getAddress());
			pstmt.setString(7, member.getId());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}
	
	public void updatePw(String id, String name, String passwd, String jumin1, String jumin2) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbname = "";
		String dbpasswd = "";
		String dbjumin1 = "";
		String dbjumin2 = "";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from zipcode_member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dbname = rs.getString("name");
				dbpasswd = rs.getString("passwd");
				dbjumin1 = rs.getString("jumin1");
				dbjumin2 = rs.getString("jumin2");
				
				if (dbname.equals(name) && dbjumin1.equals(jumin1) && dbjumin2.equals(jumin2)) {
					pstmt = conn.prepareStatement("update zipcode_member set passwd = ?" + "where id = ?");
					
					pstmt.setString(1, passwd);
					pstmt.setString(2, id);
					
					pstmt.executeUpdate();
					
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}
	
	public int findPw(String id, String name, String jumin1, String jumin2) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		
		String dbid = "";
		String dbname = "";
		String dbjumin1 = "";
		String dbjumin2 = "";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from zipcode_member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dbid = rs.getString("id");
				dbname = rs.getString("name");
				dbjumin1 = rs.getString("jumin1");
				dbjumin2 = rs.getString("jumin2");
				
				if (dbname.equals(name) && dbjumin1.equals(jumin1) && dbjumin2.equals(jumin2)) {
					x = 1;
				} else {
					x = -1;
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
	
	public int deleteMember(String id, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select passwd from zipcode_member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dbpasswd = rs.getString("passwd");
				
				if(dbpasswd.equals(passwd)) {
					pstmt = conn.prepareStatement("delete from zipcode_member where id = ?");
					pstmt.setString(1, id);
					
					pstmt.executeUpdate();
					
					x = 1;	//회원탈괴 성공
				} else {
					x = 0;	//비밀번호 틀림
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
	
	public Vector zipcodeRead(String area4) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();
		
		try {
			conn = getConnection();
			String Query = "select * from zipcode where area4 like '" +area4+"%'";
			pstmt = conn.prepareStatement(Query);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ZipcodeBean tempZipcode = new ZipcodeBean();
				tempZipcode.setZipcode(rs.getString("zipcode"));
				tempZipcode.setArea1(rs.getString("area1"));
				tempZipcode.setArea2(rs.getString("area2"));
				tempZipcode.setArea3(rs.getString("area3"));
				tempZipcode.setArea4(rs.getString("area4"));
				vecList.addElement(tempZipcode);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return vecList;
	}
}

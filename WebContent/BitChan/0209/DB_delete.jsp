<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");

	String memberID = request.getParameter("memberID");
	String password = request.getParameter("password");
	
	String DB_password = "";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:XE";
		String dbUser = "scott";
		String dbPass = "tiger";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		pstmt = conn.prepareStatement("select PASSWORD from DB_MEMBER where MEMBERID = ?");
		pstmt.setString(1, memberID);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			DB_password = rs.getString("password");
			
			if(password.equals(DB_password)) {
				pstmt = conn.prepareStatement("delete from DB_MEMBER where MEMBERID = ?");
				pstmt.setString(1, memberID);
				pstmt.executeUpdate();
				out.println("삭제성공");
			} else {
				out.println("삭제실패");
			}
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		if (rs != null) rs.close();
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>
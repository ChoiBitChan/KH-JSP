<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");

	String memberID = request.getParameter("memberID");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:XE";
		String dbUser = "scott";
		String dbPass = "tiger";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		pstmt = conn.prepareStatement("insert into DB_MEMBER values (?,?,?,?)");
		
		pstmt.setString(1, memberID);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		
		pstmt.executeUpdate();
		
	} finally {
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

	DB_MEBER 테이블에 새로운 레코드를 삽입했습니다.

</body>
</html>
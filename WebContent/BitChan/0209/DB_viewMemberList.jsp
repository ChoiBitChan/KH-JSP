<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	DB_MEMBER 테이블의 내용
	<table width="100%" border="1">
		<tr>
			<td>이름</td><td>아이디</td><td>이메일</td>
		</tr>
	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
	
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:XE";
			String dbUser = "scott";
			String dbPass = "tiger";
			
			String query = "select * from DB_MEMBER order by MEMBERID";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
	%>
		<tr>
			<td><%= rs.getString("NAME") %></td>
			<td><%= rs.getString("MEMBERID") %></td>
			<td><%= rs.getString("EMAIL") %></td>
		</tr>
	<%				
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		}
	%>
	</table>
</body>
</html>
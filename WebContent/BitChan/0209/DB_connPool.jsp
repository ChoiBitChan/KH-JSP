<%@page import="java.sql.DriverManager"%>
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
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			try {
				String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
				String query = "select * from DB_MEMBER order by MEMBERID";
				conn = DriverManager.getConnection(jdbcDriver);
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
			} finally {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			}
		%>
	</table>
</body>
</html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");

	String memberID = request.getParameter("memberID");
	String name = request.getParameter("name");
	
	int updateCount = 0;
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:XE";
		String dbUser = "scott";
		String dbPass = "tiger";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		pstmt = conn.prepareStatement("update DB_MEMBER set NAME = ? where MEMBERID = ?");
		
		pstmt.setString(1, name);
		pstmt.setString(2, memberID);
		
		pstmt.executeUpdate();
		updateCount = pstmt.executeUpdate();
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

	<%  if (updateCount > 0) { %>
	<%= memberID %>의 이름을 <%= name %>(으)로 변경
	<%  } else { %>
	<%= memberID %> 아이디가 존재하지 않음
	<%  } %>
	
</body>
</html>
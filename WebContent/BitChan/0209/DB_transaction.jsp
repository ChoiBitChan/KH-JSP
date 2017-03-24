<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
	String idValue = request.getParameter("id");

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:XE";
	String dbUser = "scott";
	String dbPass = "tiger";
	
	Throwable occuredException = null;
	
	try {
		int id = Integer.parseInt(idValue);
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement("insert into item values (?,?)");
		pstmt.setInt(1, id);
		pstmt.setString(2, "상품 이름" + id);
		pstmt.executeUpdate();
		
		if(request.getParameter("error") != null) {
			throw new Exception("의도적 익셉션 발생");
		}
		
		pstmt = conn.prepareStatement("insert into item_detail values (?,?)");
		pstmt.setInt(1, id);
		pstmt.setString(2, "상세 설명" + id);
		pstmt.executeUpdate();
		
		conn.commit();
	} catch (Throwable e) {
		if(conn != null) {
			try {
				conn.rollback();
			} catch (SQLException sql_e) {
				
			}
		}
		occuredException = e;
	} finally {
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<%  if (occuredException != null) { %>
	에러가 발생: <%= occuredException.getMessage() %>
	<%  } else { %>
	데이터가 성공적으로 들어감
	<%  } %>

</body>
</html>
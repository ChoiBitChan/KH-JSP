<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.net.URLEncoder" %>
<%@ page import = "java.net.URLDecoder" %>
<%
	Cookie cookie = new Cookie("name", URLEncoder.encode("자바", "UTF-8"));
	response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<%= cookie.getName() %> 쿠기의 값 = "<%= cookie.getValue() %>"
	<br/>
	<%= cookie.getName() %> 쿠기의 값 = "<%= URLDecoder.decode(cookie.getValue(), "UTF-8") %>"

</body>
</html>
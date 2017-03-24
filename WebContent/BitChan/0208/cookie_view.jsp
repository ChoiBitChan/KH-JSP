<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	쿠키 목록<br/>
	<%
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
	%>
		<%= cookies[i].getName() %> =
		<%= URLDecoder.decode(cookies[i].getValue(), "UTF-8") %><br/>
	<%
			}
		} else {
	%>
	쿠키가 존재하지 않습니다.
	<%
		}
	%>

</body>
</html>
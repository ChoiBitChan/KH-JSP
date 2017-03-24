<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session = "true" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%
	Date time = new Date();
	SimpleDateFormat formatter = 
			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<!-- 세션ID는 "cookie_view" 실행 후 나오는 세션ID와 같다 -->

	세션ID : <%= session.getId() %> <br>
	<%
		time.setTime(session.getCreationTime());
	%>
	세션생성시간 : <%= formatter.format(time) %> <br>
	<%
		time.setTime(session.getLastAccessedTime());
	%>
	최근접근시간 : <%= formatter.format(time) %>

</body>
</html>
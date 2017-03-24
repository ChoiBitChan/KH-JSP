<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	name 파라미터 값 : 
	<%= request.getParameter("name").toUpperCase() %>	

</body>
</html>
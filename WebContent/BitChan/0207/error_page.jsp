<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="../../Exam4/error/viewErrorMessage.jsp" %>
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
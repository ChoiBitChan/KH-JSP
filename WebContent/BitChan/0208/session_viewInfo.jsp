<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	memberId = <%= session.getAttribute("memberId") %>
	<br>
	memberName = <%= session.getAttribute("memberName") %>

</body>
</html>
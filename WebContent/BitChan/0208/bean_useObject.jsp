<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="member" scope="request" class="day0208.bean_memberInfo"/>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<%= member.getName() %> (<%= member.getId() %>) 회원님 안녕하세요.

</body>
</html>
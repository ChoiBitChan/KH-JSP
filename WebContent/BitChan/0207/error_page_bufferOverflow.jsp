<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page buffer="1kb" %>
<%@ page errorPage = "../../Exam4/error/viewErrorMessage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	
	<!-- 버퍼 플러시 이후 에러 발생 결과 -->
	
	<% for (int i = 0; i < 300; i++) { out.println(i); } %>
	
	<%= 1 / 0 %>

</body>
</html>
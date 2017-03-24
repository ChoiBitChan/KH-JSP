<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page buffer="2kb" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<% for (int i = 0; i < 512; i++) {%>
	<%= i %>
	<% } %>
	
	<!-- 버퍼가 꽉차버리기 때문에 forward 하지 못한다 -->	
	<jsp:forward page="../../Exam3/to/to.jsp"/>

</body>
</html>
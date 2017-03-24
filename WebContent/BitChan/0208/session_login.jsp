<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	if(id.equals(password)){
		session.setAttribute("memberId", id);
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	로그인에 성송했습니다.

</body>
</html>
<%
	} else {
%>
<script>
	alert("로그인에 실패하였습니다.");
	history.go(-1);
</script>
<%
	}
%>
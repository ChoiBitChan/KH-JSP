<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
	String memberId = (String)session.getAttribute("memberId");
	boolean login = memberId == null ? false : true;
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<%
		if(login){
	%>
	아이디 "<%= memberId %>"로 로그인 한 상태
	<%
		}else {
	%>
	로그인 하지 않은 상태
	<%
		}
	%>
	
</body>
</html>
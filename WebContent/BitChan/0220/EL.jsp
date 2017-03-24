<%@page import="day0220.EL_Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<%
		EL_Member m = new EL_Member();
		m.setName("이름1");
		
		int[] a = {1,2,3};
	%>
	
	<c:set var="m" value="<%= m %>" />
	
	<c:set var="name" value="${m.name}" />
	
	<c:set var="a" value="<%= a %>" />
	
	${name}
	<br/>
	${a[1]}
	
</body>
</html>
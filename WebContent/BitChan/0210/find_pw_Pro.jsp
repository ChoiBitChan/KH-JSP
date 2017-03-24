<%@page import="day0210.LogonDBBean"%>
<%@ include file="color.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String jumin1 = request.getParameter("jumin1");
	String jumin2 = request.getParameter("jumin2");
	
	LogonDBBean manager = LogonDBBean.getInstance();
	manager.findPw(id, name, jumin1, jumin2);
	
	if (manager.findPw(id, name, jumin1, jumin2) == 1) {
%>		



<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	일치

<%
	}
%>
</body>
</html>
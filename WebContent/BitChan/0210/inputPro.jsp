<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "day0210.LogonDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id = "member" class = "day0210.LogonDataBean" >
	<jsp:setProperty name = "member" property = "*" />
</jsp:useBean>

<%
	member.setReg_date(new Timestamp(System.currentTimeMillis()));
	LogonDBBean manager = LogonDBBean.getInstance();
	manager.insertMember(member);
	
	response.sendRedirect("loginForm.jsp");
%>
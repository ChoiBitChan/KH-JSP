<%@page import="day0214_board.BoardDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="article" scope="page" class="day0214_board.BoardDataBean">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>

<%
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	article.setIp(request.getRemoteAddr());
	
	BoardDBBean dbPro = BoardDBBean.getInstance();
	dbPro.insertArticle(article);
	
	response.sendRedirect("list.jsp");
%>
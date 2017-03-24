<%@page import="day0214_board.CommentDBBean"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="day0214_board.CommentDBBean" %> 
<%@ page import="java.sql.Timestamp" %> 
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="cmt" scope="page" class="day0214_board.CommentDataBean">
	<jsp:setProperty name="cmt" property="*"/>
</jsp:useBean>
<%
	CommentDBBean comt=CommentDBBean.getInstance();
	cmt.setReg_date(new Timestamp(System.currentTimeMillis()));
	cmt.setIp(request.getRemoteAddr());


	comt.insertComment(cmt);
	
	String content_num=request.getParameter("content_num");
	String p_num=request.getParameter("p_num");
	String url="content1.jsp?num="+content_num+"&pageNum="+p_num;
	response.sendRedirect(url);
%>
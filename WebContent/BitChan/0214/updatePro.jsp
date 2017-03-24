<%@page import="day0214_board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="article" scope="page" class="day0214_board.BoardDataBean">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>

<%
	String pageNum = request.getParameter("pageNum");

	BoardDBBean dbPro = BoardDBBean.getInstance();
	
	int check = dbPro.updateArticle(article);
	
	if (check == 1) {
%>
	<meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>">
<%	} else if (check == 0){ %>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
<%
	}
%>
<%@page import="day0210.LogonDBBean"%>
<%@ include file="color.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

	<jsp:useBean id="member" class="day0210.LogonDataBean">
		<jsp:setProperty name="member" property="*"/>
	</jsp:useBean>
	
<%
	String cname = request.getParameter("name");
	String cpasswd = request.getParameter("passwd");
	String cjumin1 = request.getParameter("jumin1");
	String cjumin2 = request.getParameter("jumin2");
	
	String id = (String)session.getAttribute("memId");
	member.setId(id);
	
	LogonDBBean manager = LogonDBBean.getInstance();
	
	manager.updatePw(id, cname, cpasswd, cjumin1, cjumin2);
%>

	<link href="style.css" rel="stylesheet" type="text/css">
	
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<table width="270" border="0" cellspacin="0" cellpadding="5" align="center">
		<tr bgcolor="<%= title_c %>">
			<td height="39" align="center">
				<font size="+1"><b>비밀번호가 수정되었습니다.</b></font>
			</td>
		</tr>
		<tr>
			<td bgcolor="<%= value_c %>" align="center">
				<p>입력하신 내용대로 수정이 완료되었습니다.</p>
			</td>
		</tr>
		<tr>
			<td bgcolor="<%= value_c %>" align="center">
				<form>
					<input type="button" value="메인으로" onclick="window.location='main.jsp'">
				</form>
				5초 후에 메인으로 이동합니다.
				<meta http-equiv="Refresh" content="5;url=main.jsp">
			</td>
		</tr>
	</table>
</body>
</html>
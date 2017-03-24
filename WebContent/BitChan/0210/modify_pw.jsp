<%@page import="day0210.LogonDataBean"%>
<%@page import="day0210.LogonDBBean"%>
<%@ include file="color.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	
	<link href="style.css" rel="stylesheet" type="text/css">
	
	<script>
		function checkIt() {
			var userinput = eval("document.userinput");
			
			if (!userinput.passwd.value) {
				alert("바꾸실 비밀번호를 입력하세요");
				return false;
			}
			if (!userinput.username.value) {
				alert("사용자 이름을 입력하세요.");
				return false;
			}
			if (!userinput.jumin1.value || !userinput.jumin2.value) {
				alert("주민등록번호를 입력하세요.");
				return false;
			}
		}
	</script>

<%
	String id = (String)session.getAttribute("memId");

	LogonDBBean manager = LogonDBBean.getInstance();
	LogonDataBean c = manager.getMember(id);
%>
	
</head>
<body bgcolor="<%=bodyback_c%>">

	<form name="userinput" action="modify_pw_Pro.jsp" method="post" onsubmit="return checkIt()">
		<table width="600" border="1" cellspacing="0" cellpadding="3" align="center">
			<tr>
				<td  colspan="2" height="39" bgcolor="<%=title_c%>" align="center">
					<font size="+1" ><b>비밀번호 변경</b></font>
				</td>
			</tr>
			<tr>
				<td width="200"> 사용자 ID</td>
      			<td width="400"><%=c.getId()%></td>
			</tr>
			<tr>
				<td width="200"> 비밀번호</td>
      			<td width="400">
        			<input type="password" name="passwd" size="10" maxlength="15">
        		</td>
			</tr>
			<tr>
				<td width="200"> 이름</td>
      			<td width="400">
        			<input type="text" name="name" size="10" maxlength="15">
        		</td>
			</tr>
			<tr>
				<td width="200">주민등록번호</td>
      			<td width="400">
        			<input type="text" name="jumin1" size="7" maxlength="6">-<input type="text" name="jumin2" size="7" maxlength="7">
      			</td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="<%=value_c%>">
       				<input type="submit" name="modify" value="비밀번호 변경" >
       				<input type="button" value="취소" onclick="javascript:window.location='main.jsp'">     
      			</td>
			</tr>
		</table>
	</form>

</body>
</html>
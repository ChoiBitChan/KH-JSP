<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="color.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

	<link href="style.css" rel="stylesheet" type="text/css">
	
	<script>
		function checkIt() {
			var userinput = eval("document.userinput");
			
			if (!userinput.id.value) {
				alert("아이디를 입력하세요");
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
	
</head>
<body bgcolor="<%=bodyback_c%>">

	<form name="userinput" action="find_pw_Pro.jsp" method="post" onsubmit="return checkIt()">
		<table width="600" border="1" cellspacing="0" cellpadding="3" align="center">
			<tr>
				<td  colspan="2" height="39" bgcolor="<%=title_c%>" align="center">
					<font size="+1" ><b>비밀번호 찾기</b></font>
				</td>
			</tr>
			<tr>
				<td width="200"> 아이디</td>
      			<td width="400">
        			<input type="text" name="id" size="10" maxlength="15">
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
       				<input type="submit" name="modify" value="비밀번호 찾기" >
       				<input type="button" value="취소" onclick="javascript:window.location='main.jsp'">     
      			</td>
			</tr>
		</table>
	</form>
</body>
</html>
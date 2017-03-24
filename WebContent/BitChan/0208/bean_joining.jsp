<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="memberInfo" class="day0208.bean_memberInfo"/>
<jsp:setProperty name="memberInfo" property="*"/>
<jsp:setProperty name="memberInfo" property="password" value=""/>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<table width="400" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td>아이디</td>
			<td><jsp:getProperty name="memberInfo" property="id" /></td>
			<td>암호</td>
			<td><jsp:getProperty name="memberInfo" property="password" /></td>
		</tr>
		<tr>
		<tr>
		    <td>이름</td>
		    <td><jsp:getProperty name="memberInfo" property="name" /></td>
		    <td>이메일</td>
		    <td><jsp:getProperty name="memberInfo" property="email" /></td>
		</tr>
		<tr><td>나이</td>
		    <td><jsp:getProperty name="memberInfo" property="age" /></td>
		</tr>
	</table>
	
</body>
</html>
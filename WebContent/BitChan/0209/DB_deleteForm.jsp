<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	
	<form action="DB_delete.jsp" method="post">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="memberID" size="10"></td>
			<td>암호</td>
			<td><input type="password" name="password" size="10"></td>
		</tr>
		<tr>
			<td clospan="4"><input type="submit" value="삭제"></td>
		</tr>
	</form>
	
</body>
</html>
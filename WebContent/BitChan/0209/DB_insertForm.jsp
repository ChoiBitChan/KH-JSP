<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	
	<form action="DB_insert.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="memberID" size="10"></td>
				<td>암호</td>
				<td><input type="password" name="password" size="10"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" size="10"></td>
				<td>이메일</td>
				<td><input type="text" name="email" size="10"></td>
			</tr>
			<tr>
				<td colspan="4"><input type="submit" value="삽입"></td>
			</tr>	
		</table>
	</form>

</body>
</html>
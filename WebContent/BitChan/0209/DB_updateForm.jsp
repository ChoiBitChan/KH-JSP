<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<form action="DB_update.jsp" method="post">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="memberID" size="10"></td>
			<td>이름</td>
			<td><input type="text" name="name" size="10"></td>
		</tr>
		<tr>
			<td clospan="4"><input type="submit" value="변경"></td>
		</tr>
	</form>

</body>
</html>
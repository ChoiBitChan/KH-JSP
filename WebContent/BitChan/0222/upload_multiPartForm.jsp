<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<form action="upload_multiPartPro.jsp" method="post" enctype="multipart/form-data">
		text1: <input type="text" name="text1" /> <br/>
		file1: <input type="file" name="file1" /> <br/>
		file2: <input type="file" name="file2" /> <br/>
		<input type="submit" value="전송" />
	</form>

</body>
</html>
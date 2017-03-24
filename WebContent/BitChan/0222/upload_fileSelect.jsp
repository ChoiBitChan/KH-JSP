<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	
	<form name="fileForm" method="post" enctype="multipart/form-data" action="upload_fileUpload.jsp">
		작성자: 
		<input type="text" name="user"><br>
		제  목: 
		<input type="text" name="title"><br>
		파일명: 
		<input type="file" name="uploadFile"><br>
		<input type="submit" value="파일 올리기"><br>
	</form>
	
</body>
</html>
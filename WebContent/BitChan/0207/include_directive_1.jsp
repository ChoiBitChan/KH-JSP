<%@ page  contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<%
		int number = 10;
	%>
	
	<%@ include file="include_directive_2.jspf" %>
	
	공통변수 DataFolder = "<%= dataFolder %>"

</body>
</html>
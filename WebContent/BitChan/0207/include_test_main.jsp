<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>include_test_main</title>
</head>
<body>

	include_main.jsp에서 생성.
	
	<jsp:include page="include_test_sub.jsp" flush="false"/>
	
	jsp:include 이후의 내용.

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<table width="100" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td>제품번호</td> <td>XXXX</td>
		</tr>
		<tr>
			<td>가격</td> <td>10,000원</td>
		</tr>
	</table>
	
	
	<jsp:include page="include_info_sub.jsp" flush="false">
		<jsp:param name="type" value="B"/>
	</jsp:include>
	
	<!-- 
	<% request.setAttribute("type", "A"); %>
	<jsp:include page="include_info_sub.jsp" flush="false"/>
	 -->
	 
</body>
</html>
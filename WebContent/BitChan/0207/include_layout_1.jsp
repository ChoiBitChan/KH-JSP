<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<table width="400"	border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2">
				<jsp:include page="include_layout_top.jsp"	flush="false"/>
			</td>
		</tr>
		<tr>
			<td width="100" valign="top">
				<jsp:include page="include_layout_left.jsp" flush="false"/>
			</td>
			<td width="300" valign="top">
				<!-- 내용 부분 : 시작 -->
				레이아웃1
				<br><br><br>
				<!-- 내용 부분 : 끝 -->
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<jsp:include page="include_layout_bottom.jsp" flush="false"/>
			</td>
		</tr>
	</table>

</body>
</html>
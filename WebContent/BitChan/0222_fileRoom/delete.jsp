<%@page import="day0222.dao.PdsItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

	<%
		String[] deleteItemId = request.getParameterValues("deleteCheck");
	
		if (deleteItemId != null) {
			for (int i = 0; i < deleteItemId.length; i++) {
				System.out.println("delete.jsp : " + deleteItemId[i]);
				PdsItemDao dao = PdsItemDao.getInstance();
				dao.delete(deleteItemId[i]);
			}
		}
	%>
	
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<%
		if (deleteItemId.length > 0) {
	%>	
			<%= deleteItemId.length %>개의 파일을 삭제 했습니다.<br/>
			<a href="list.jsp">목록보기</a>
	<%		
		} else {
	%>
			삭제에 실패하였습니다.<br/>
			<a href="list.jsp">목록보기</a>
	<%
		}
	%>
	
</body>
</html>
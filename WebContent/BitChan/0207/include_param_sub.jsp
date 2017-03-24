<%@ page language="java" contentType="text/html; charset=UTF-8" %>
include_param_sub.jsp 에서 name 파라미터 값 : <%= request.getParameter("name") %>
<br/>
<br/>
name 파라미터 값 목록 : 
<ul>
	<%
		String[] names = request.getParameterValues("name");
		for(String name : names) {
	%>
		<li> <%= name %> </li>
	<%
		}
	%>
</ul>
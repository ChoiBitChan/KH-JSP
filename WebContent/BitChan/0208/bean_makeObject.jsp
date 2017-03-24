<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="member" scope="request" class="day0208.bean_memberInfo"/>
<%
	member.setId("KH");
	member.setName("자바");
%>
<jsp:forward page="bean_useObject.jsp"/>
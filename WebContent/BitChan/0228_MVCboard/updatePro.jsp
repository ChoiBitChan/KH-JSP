<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check==1}">
<meta http-equiv="Refresh" content="0;url=/JSP_study/BitChan/0228_MVCboard/list.do?pageNum=${pageNum}" >
</c:if>
<c:if test="${check==0}">
비밀번호가 다릅니다.
<br>
<a href="javascript:history.go(-1)">[글수정 폼으로 돌아가기]</a>
</c:if>
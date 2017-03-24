<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form action="delete.jsp" method="post">
		<table border="1">
			<c:if test="${listModel.totalPageCount > 0}">
				<tr>
					<td colspan="6">
						${listModel.startRow}-${listModel.endRow}
						[${listModel.requestPage}/${listModel.totalPageCount}]
					</td>
				</tr>
			</c:if>
			
			<tr>
				<td>번호</td>
				<td>파일명</td>
				<td>파일크기</td>
				<td>다운로드회수</td>
				<td>다운로드</td>
				<td>삭제</td>
			</tr>
			
			<c:choose>
				<c:when test="${listModel.hasPdsItem == false}">
					 <tr>
					 	<td colspan="6">
					 		게시글이 없습니다.
					 	</td>
					 </tr>
				 </c:when>
				 <c:otherwise>
				 	<c:forEach var="item" items="${listModel.pdsItemList}">
				 		<tr>
				 			<td>${item.id}</td>
				 			<td>${item.fileName}</td>
				 			<td>${item.fileSize}</td>
				 			<td>${item.downloadCount}</td>
				 			<td><a href="download.jsp?id=${item.id}">다운받기</a></td>
				 			<td><input type="checkbox" name="deleteCheck" value="${item.id}"></td>
				 		</tr>
				 	</c:forEach>
				 	<tr>
				 		<td colspan="6">
				 			<c:if test="${beginPage > 10}">
				 				<a href="list.jsp?p=${beginPage-1}">이전</a>
				 			</c:if>
				 			<c:forEach var="pno" begin="${beginPage}" end="${endPage}">
				 				<a href="list.jsp??=${pno}">[${pno}]</a>
				 			</c:forEach>
				 			<c:if test="${endPage < listModel.totalPageCount}">
				 				<a href="list.jsp?p=${endPage + 1}">다음</a>
				 			</c:if>
				 		</td>
				 	</tr>
				 </c:otherwise>
			</c:choose>
			<tr>
				<td colspan="6">
					<a href="uploadForm.jsp">파일 첨부</a>
					<input type="submit" value="파일 삭제">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<form action="<%= request.getContextPath() %>/Exam3/view.jsp">
	
		ContextPath : <%= request.getContextPath() %><br/>
		
		보고 싶은 페이지 선택 : 
			<select name="code">
				<option value="A">A 페이지</option>
				<option value="B">B 페이지</option>
				<option value="C">C 페이지</option>
			</select>
			
			<input type="submit" value="이동">
			
	</form>

</body>
</html>
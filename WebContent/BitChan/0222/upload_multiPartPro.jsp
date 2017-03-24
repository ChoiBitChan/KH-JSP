<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if (isMultipart) {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		upload.setHeaderEncoding("UTF-8");
		
		List<FileItem> items = upload.parseRequest(request);
		Iterator<FileItem> iter = items.iterator();
		
		while (iter.hasNext()) {
			FileItem item = iter.next();
			
			if (item.isFormField()) {
				String name = item.getFieldName();
				String value = item.getString("UTF-8");
				%>
					요청 파라미터 : <%= name %>=<%= value %><br/>
				<%
			} else {
				String name = item.getFieldName();
				String fileName = item.getName();
				String contentType = item.getContentType();
				boolean isInMemory = item.isInMemory();
				long sizeInBytes = item.getSize();
				
				File file = new File("f://item/"+fileName);
				item.write(file);
				%>
					파일 : <%= name %>, <%= fileName %>, <%= sizeInBytes %>, <%= contentType %>,
					<%= isInMemory ? "메모리저장" : "임시파일저장" %> <br/>
				<%
			}
		}
	} else {
		%>
			multipart/form 요청이 아님.
		<%
	}
%>

</body>
</html>
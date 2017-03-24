<%@page import="day0222.service.AddPdsItemService"%>
<%@page import="day0222.model.PdsItem"%>
<%@page import="day0222.file.FileSaveHelper"%>
<%@page import="java.util.Iterator"%>
<%@page import="day0222.model.AddRequest"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	// uploadForm.jsp에서 enctype="multipart/form-data"로 왔는지 확인
	if (!isMultipart) {
		response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
	DiskFileItemFactory factory = new DiskFileItemFactory();
	
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setHeaderEncoding("UTF-8");		// 업로드된 파일의 한글처리
	List<FileItem> items = upload.parseRequest(request);
	
	AddRequest addRequest = new AddRequest();
	
	Iterator<FileItem> iter = items.iterator();
	
	while (iter.hasNext()) {
		FileItem item = iter.next();
		if (item.isFormField()) {
			String name = item.getFieldName();
			if (name.equals("description")) {
				String value = item.getString("UTF-8");
				addRequest.setDescription(value);
			}
		} else {
			String name = item.getFieldName();
			if (name.equals("file")) {
				String realPath = FileSaveHelper.save("f:\\item", item.getInputStream());
				addRequest.setFileName(item.getName());
				addRequest.setFileSize(item.getSize());
				addRequest.setRealPath(realPath);
			}
		}
	}
	PdsItem pdsItem = AddPdsItemService.getInstance().add(addRequest);
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<%= pdsItem.getFileName() %> 파일을 업로드 했습니다.<br/>
	<a href="list.jsp">목록보기</a>
	
</body>
</html>
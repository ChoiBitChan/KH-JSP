<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
	String realFolder = "";

	String saveFolder = "fileSave";
	String encType = "UTF-8";
	int maxSize = 5 * 1024 * 1024;
	
	ServletContext context = getServletContext();
	
	realFolder = context.getRealPath(saveFolder);
	out.println("the realpath is : " + realFolder + "<br>");
	
	try {
		MultipartRequest multi = null;
		multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		
		Enumeration params = multi.getParameterNames();
		
		while(params.hasMoreElements()) {
			String name = (String)params.nextElement();
			String value = multi.getParameter(name);
			out.println(name + " = " + value + "<br>");
		}
		
		out.println("======================================<br>");
		
		Enumeration files = multi.getFileNames();
		
		while(files.hasMoreElements()) {
			String name = (String)files.nextElement();
			String filename = multi.getFilesystemName(name);
			String original = multi.getOriginalFileName(name);
			String type = multi.getContentType(name);
			
			
			File file = multi.getFile(name);
			
			out.println("파라미터 이름 : " + name + "<br>");
			out.println("실제 파일 이름 : " + original + "<br>");
			out.println("저장된 파일 이름 : " + filename + "<br>");
			out.println("파일 타입 : " + type + "<br>");
			
			if (file != null) {
				out.println("크기 : " + file.length());
				out.println("<br>");
			}
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
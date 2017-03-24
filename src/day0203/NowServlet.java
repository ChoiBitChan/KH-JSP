package day0203;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/nowServlet")
public class NowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		Date now = new Date();
	
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head><title>?˜„?ž¬?‹œê°?</title></head>");
		writer.println("<body>");
		writer.println("<h1>");		
		writer.println("?˜„?ž¬?‹œê°? :");
		writer.println(now);
		writer.println("</h1>");		
		writer.println("</body>");
		writer.println("</html>");

		writer.close();
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

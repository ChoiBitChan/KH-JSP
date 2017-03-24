package day0228_MVCboard.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import day0228_MVCboard.BoardDataBean;
import day0228_MVCboard.BoardDBBean;

public class WriteProAction implements CommandAction {// �Էµ� �� ó��

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");// �ѱ� ���ڵ�

		BoardDataBean article = new BoardDataBean();// ������ó�� ��
		article.setNum(Integer.parseInt(request.getParameter("num")));
		article.setWriter(request.getParameter("writer"));
		article.setEmail(request.getParameter("email"));
		article.setSubject(request.getParameter("subject"));
		article.setPasswd(request.getParameter("passwd"));
		article.setReg_date(new Timestamp(System.currentTimeMillis()));
		article.setRef(Integer.parseInt(request.getParameter("ref")));
		article.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		article.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		article.setContent(request.getParameter("content"));
		article.setIp(request.getRemoteAddr());

		BoardDBBean dbPro = BoardDBBean.getInstance();// DBó��
		dbPro.insertArticle(article);

		return "/BitChan/0228_MVCboard/writePro.jsp";
	}
}
package day0228_MVCboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import day0228_MVCboard.BoardDataBean;
import day0228_MVCboard.BoardDBBean;

public class UpdateFormAction implements CommandAction {//�ۼ��� ��

    public String requestPro(HttpServletRequest request,
        HttpServletResponse response) throws Throwable {

        int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");

        BoardDBBean dbPro = BoardDBBean.getInstance();
        BoardDataBean article =  dbPro.updateGetArticle(num);

	//�ش� �信�� ����� �Ӽ�
        request.setAttribute("pageNum", new Integer(pageNum));
        request.setAttribute("article", article);

        return "/BitChan/0228_MVCboard/updateForm.jsp";//�ش��
    }
}

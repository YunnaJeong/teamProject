package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnaDAO;

public class AdminQnaDeleteAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int q_id = Integer.parseInt(request.getParameter("q_id"));	
		QnaDAO dao = new QnaDAO();
		dao.qnaDelete(q_id);
		
		AdminQnaListAction a = new AdminQnaListAction();
		a.pro(request, response);
		return "qna.jsp";
	}
}

package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnaDAO;
import vo.QnaVO;

public class AdminQnaUpdateOKAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int q_id = Integer.parseInt(request.getParameter("q_id"));
		String q_title = request.getParameter("q_title");
		String q_answer = request.getParameter("q_answer");
		
		QnaDAO dao = new QnaDAO();
		int re = dao.qnaUpdate(q_id, q_title, q_answer);
		
		String viewPage = "detailQna.jsp";
		
		if (re != 1) {
			viewPage = "updateQna.jsp";
		}
		
		QnaVO q = dao.qnaDetail(q_id);
		request.setAttribute("q", q);
		
		AdminQnaDetailAction a = new AdminQnaDetailAction();
		a.pro(request, response);
		return viewPage;
	}

}

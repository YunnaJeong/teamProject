package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnaDAO;
import vo.QnaVO;

public class AdminQnaInsertOKAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String q_title = request.getParameter("q_title");
		String q_answer = request.getParameter("q_answer");
		String viewpage = "qna.jsp";
		
		QnaDAO dao = new QnaDAO();
		int re = dao.qnaInsert(q_title, q_answer);
		
		if (re != 1) {
			viewpage = "insertQna.jsp";
		}
		
		ArrayList<QnaVO> list = dao.qnaList();
		request.setAttribute("list", list);
		
		
		return viewpage;
	}

}

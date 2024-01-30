package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnaDAO;
import vo.QnaVO;

public class AdminQnaDetailAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int q_id = Integer.parseInt(request.getParameter("q_id"));
		QnaDAO dao = new QnaDAO();
		QnaVO q = dao.qnaDetail(q_id);
		
		request.setAttribute("q", q);
		
		return "detailQna.jsp";
	}

}

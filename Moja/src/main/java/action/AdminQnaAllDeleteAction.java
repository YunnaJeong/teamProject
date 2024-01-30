package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnaDAO;

public class AdminQnaAllDeleteAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] id_arr = request.getParameterValues("del_id");
		
		QnaDAO dao = new QnaDAO();
		dao.qnaAllDelete(id_arr);
		AdminQnaListAction a = new AdminQnaListAction();
		a.pro(request, response);
		return "qna.jsp";
	}
}

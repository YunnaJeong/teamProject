package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ExamDAO;
import vo.ExamVO;

public class AdminExamListAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ExamDAO dao = new ExamDAO();
		ArrayList<ExamVO> list = dao.allExamList();
		request.setAttribute("list", list);
		return "exam.jsp";
	}

}

package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ExamDAO;
import dao.ExamPlanDAO;
import vo.ExamPlanVO;
import vo.ExamVO;

public class AdminExamDetailAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int e_id = Integer.parseInt(request.getParameter("e_id"));
		
		ExamDAO dao = new ExamDAO();
		ExamPlanDAO ep_dao = new ExamPlanDAO();
		ExamVO e = dao.examDetail(e_id);
		ArrayList<ExamPlanVO> list = ep_dao.epList(e.getSeriesnm());
		
		request.setAttribute("e", e);
		request.setAttribute("list", list);
		
		return "detailExam.jsp";
	}

}

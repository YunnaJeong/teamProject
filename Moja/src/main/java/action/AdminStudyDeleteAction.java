package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnaDAO;
import dao.StudyDAO;
import dao.UserDAO;
import vo.StudyVO;

public class AdminStudyDeleteAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int s_id = Integer.parseInt(request.getParameter("s_id"));
		StudyDAO dao = new StudyDAO();
		dao.studyDelete(s_id);
		
		ArrayList<StudyVO> list = dao.studyList();
		request.setAttribute("list", list);
		
		AdminStudyListAction a = new AdminStudyListAction();
		a.pro(request, response);
		return "study.jsp";
	}
}

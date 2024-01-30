package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudyDAO;

public class StudyPostDeleteAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyDAO dao = new StudyDAO();
		int s_id = Integer.parseInt(request.getParameter("s_id"));
		dao.studyPostDelete(s_id);
		new StudyPostListAction().pro(request, response);
		return "studyList.jsp";
	}

}

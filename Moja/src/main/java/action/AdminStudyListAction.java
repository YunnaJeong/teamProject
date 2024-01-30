package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudyDAO;
import vo.StudyVO;

public class AdminStudyListAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyDAO dao = new StudyDAO();
		ArrayList<StudyVO> list = dao.studyList();
		request.setAttribute("list", list);
		return "study.jsp";
	}

}

package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.StudyDAO;

public class StudyPostWriteOKAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String s_title = request.getParameter("s_title");
		String s_content = request.getParameter("s_content");
		String id = (String)session.getAttribute("id");
		String exam_name = request.getParameter("exam_name");
		
		System.out.printf("title : %s, content : %s, id : %s, exam_name : %s \n",s_title, s_content, id, exam_name);
		
		StudyDAO dao = new StudyDAO();
		dao.studyPostWrite(s_title, s_content, id, exam_name);
		new StudyPostListAction().pro(request, response);
		return "studyList.jsp";
	}

}

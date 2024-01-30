package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudyDAO;

public class StudyStateChangAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyDAO sdao = new StudyDAO();
		int s_id = Integer.parseInt(request.getParameter("s_id"));
		request.setAttribute("s_id", s_id);
		String s_state = request.getParameter("s_state");
		if (s_state.equals("모집완료")) {
			s_state = "N";
		}else{
			s_state = "Y";
		}
		System.out.println(s_state);
		sdao.studyStateChange(s_id, s_state);
		new StudyPostDetailAction().pro(request, response);
		request.setAttribute("studyVO", sdao.studyPostDetail(s_id));
		return "studyPostDetail.jsp";
	}

}

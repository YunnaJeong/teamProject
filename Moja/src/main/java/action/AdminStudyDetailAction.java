package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDAO;
import dao.StudyDAO;
import vo.ReplyVO;
import vo.StudyVO;

public class AdminStudyDetailAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int s_id = Integer.parseInt(request.getParameter("s_id"));
		StudyDAO dao = new StudyDAO();
		StudyVO s = dao.studyDetail(s_id);
		
		ReplyDAO r_dao = new ReplyDAO();
		ArrayList<ReplyVO> list = r_dao.findAllReply(s_id);
		int cnt = r_dao.countReply(s_id);
		
		request.setAttribute("list", list);
		request.setAttribute("cnt", cnt);
		request.setAttribute("s", s);
		return "detailStudy.jsp";
	}

}

package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDAO;

public class StudyReplyDeleteAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReplyDAO rdao = new ReplyDAO();
		int s_id = Integer.parseInt(request.getParameter("s_id"));
		int r_id = Integer.parseInt(request.getParameter("r_id"));
		rdao.replyDelete(r_id);
		request.setAttribute("s_id", s_id);
		new StudyPostDetailAction().pro(request, response);
		return "studyPostDetail.jsp";
	}

}

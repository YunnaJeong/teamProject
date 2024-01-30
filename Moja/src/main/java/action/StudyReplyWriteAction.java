package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReplyDAO;

public class StudyReplyWriteAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReplyDAO dao = new ReplyDAO();
		HttpSession session = request.getSession();
		
		String R_CONTENT = request.getParameter("R_CONTENT");
		int s_id = Integer.parseInt(request.getParameter("s_id"));
		String u_id = (String)session.getAttribute("id");
		request.setAttribute("s_id", s_id);
		dao.replyWrite(R_CONTENT, s_id, u_id);
		request.removeAttribute("R_CONTENT");
		new StudyPostDetailAction().pro(request, response);
		new NewInsertAction().pro(request, response);
		new NewListAction().pro(request, response);
		return "studyPostDetail.jsp";
	}

}

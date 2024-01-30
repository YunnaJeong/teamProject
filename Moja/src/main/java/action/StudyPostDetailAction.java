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

public class StudyPostDetailAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyDAO sdao = new StudyDAO();
		int s_id = Integer.parseInt(request.getParameter("s_id"));
		sdao.studyPostCountUpdate(s_id);
		StudyVO studyVO = sdao.studyPostDetail(s_id);
		ReplyDAO rdao = new ReplyDAO();
		ArrayList<ReplyVO> replyList = rdao.replyList(s_id);
		request.setAttribute("replyList", replyList);
		request.setAttribute("replyCount", replyList.size());
		request.setAttribute("s_id", s_id);
		request.setAttribute("studyVO", studyVO);
		
		return "studyPostDetail.jsp";
	}

}

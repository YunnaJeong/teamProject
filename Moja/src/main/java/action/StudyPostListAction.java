package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReplyDAO;
import dao.StudyDAO;
import vo.ReplyVO;
import vo.StudyVO;

public class StudyPostListAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyDAO sdao = new StudyDAO();
		ReplyDAO rdao = new ReplyDAO();
		String sort = null;
		HttpSession session = request.getSession();
		if(request.getParameter("sort")!=null) {
			sort = request.getParameter("sort");
		}
		
		String s_state = null;
		if(request.getParameter("s_state")!=null) {
			s_state = request.getParameter("s_state");
		}
		
		String keyword = null;
		if(session.getAttribute("keyword")  != null) {
			keyword = (String)session.getAttribute("keyword");
		}
		
		if(request.getParameter("keyword")!=null) {
			keyword = request.getParameter("keyword");
			session.setAttribute("keyword", keyword);
		}
		System.out.println(keyword);
		int pageNum = 1;
		if(request.getParameter("pageNum")!=null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		System.out.println("pageNum : "+pageNum);
		request.setAttribute("totalPage", sdao.getTotalPage(keyword));
		ArrayList<StudyVO> studyList = sdao.studyList(sort,s_state,pageNum,keyword);
		request.setAttribute("pageNum", pageNum);
		
		request.setAttribute("studyList", studyList);
		return "studyList.jsp";
	}

}

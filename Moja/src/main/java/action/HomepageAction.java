package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ExamDAO;
import dao.YoutubeDAO;
import vo.ExamVO;

public class HomepageAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = "homepage.jsp";
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ExamDAO dao = new ExamDAO();
		YoutubeDAO yDao = new YoutubeDAO();
		String interest = dao.userInterest(id);
		System.out.println(interest);
		request.setAttribute("yList", yDao.youtubeList());
		request.setAttribute("bestList", dao.bestExamList());
		request.setAttribute("list", dao.listYoutube());
		request.setAttribute("lists", dao.interestExam(interest));
		
		return viewPage;
	}

}

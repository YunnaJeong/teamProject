package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.InquiryDAO;
import dao.StudyDAO;
import dao.UserDAO;
import dao.WishlistDAO;
import vo.UserVO;

public class MyPageHomeAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MyPageHomeAction실행" );
		String id = ""; 
		int inquireN= 0;
		int inquireY =0;
		int StudyN =0;
		int StudyY =0;
		int wish =0;
		String u_name ="";
		String viewPage="";
		
		
		
		HttpSession session = request.getSession();
		id =  (String)session.getAttribute("id");  //머지 후 세션으로 아이디받아오기 
		
		
		if(id != null) {
		viewPage = "/jsp/user/myPageHome.jsp";    // 시작경로는 wepapp을기준으로 한다. 
		UserDAO userdao = new UserDAO();
		// 전달받은 id를 통해 회원정보를 가져오는 매소드 실행.//
		UserVO u = userdao.myInfo(id);
		u_name = u.getU_name();
		
		System.out.println("이름:"+u_name);
		
		
		
		InquiryDAO inquirydao = new InquiryDAO();
		//내문의 - 답변대기 게시글 갯수를 가져옴
		inquireN = inquirydao.myInquireNUM_N(id);
		//내문의 - 답변완료 게시글 갯수를 가져옴
		 inquireY = inquirydao.myInquireNUM_Y(id);
		
		
		
		StudyDAO studydao = new StudyDAO();
		//내문의 - 답변대기 게시글 갯수를 가져옴
		StudyN = studydao.myStudyNUM_N(id);
		//내문의 - 답변완료 게시글 갯수를 가져옴
		 StudyY = studydao.myStudyNUM_Y(id);
		
		
		WishlistDAO wishdao = new WishlistDAO();
		 wish = wishdao.myWishlistNUM(id);
		
		}
		else{
			viewPage= "/jsp/user/abc.jsp"; 
		}
		
		
		
		request.setAttribute("id", id);
		request.setAttribute("inquireN", inquireN);
		request.setAttribute("inquireY", inquireY);
		request.setAttribute("StudyN", StudyN);
		request.setAttribute("StudyY", StudyY);
		request.setAttribute("wish",wish);
		request.setAttribute("u_name", u_name);
		request.setAttribute("viewPage", viewPage);
		
		return viewPage;
	}

}

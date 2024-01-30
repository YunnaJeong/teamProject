package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.InquiryDAO;
import vo.InquiryVO;

public class MyInquireAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("MyInquireAction실행" );
		HttpSession session = request.getSession();
		String id = "";
		id = (String)session.getAttribute("id"); 
		int pageNUM =1;
		if(request.getParameter("pageNUM")!=null) {
			pageNUM =Integer.parseInt(request.getParameter("pageNUM"));
		}
		System.out.println("페이지번호:"+pageNUM);
		
		InquiryDAO dao = new InquiryDAO();
		ArrayList<InquiryVO> list = dao.myInquire(pageNUM,id);
		
		
		
		String viewPage = "/jsp/user/myInquire.jsp";  
		
		request.setAttribute("list", list);
		request.setAttribute("totalPage",dao.totalPage );
		request.setAttribute("viewPage", viewPage);
		
		return viewPage;
	}

}

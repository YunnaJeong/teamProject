package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.StudyDAO;
import dao.WishlistDAO;
import vo.StudyVO;

public class MyWishlistAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id ="";
		System.out.println("MyWishlistAction실행" );
		HttpSession session = request.getSession();
//		String id = "hong";
		id = (String)session.getAttribute("id"); //머지 후 세션으로 아이디받아오기 
		
		int pageNUM =1;
		if(request.getParameter("pageNUM")!=null) {
			pageNUM =Integer.parseInt(request.getParameter("pageNUM"));
		}
		
		System.out.println("페이지번호:"+pageNUM);
		
		WishlistDAO dao = new WishlistDAO();
		//ArrayList<HashMap<String, Object>> list = dao.myWishlist(pageNUM, id);
		
		
	
		String viewPage = "/jsp/user/myWishlist.jsp";
			
		request.setAttribute("list",dao.myWishlist(pageNUM, id));
		request.setAttribute("totalPage",dao.totalPage );
		request.setAttribute("viewPage", viewPage);
		
	
		
	

		
		return viewPage;
		
	}
		

	}

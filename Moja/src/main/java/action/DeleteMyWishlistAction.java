package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.StudyDAO;
import dao.WishlistDAO;

public class DeleteMyWishlistAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		// e_id와 u_id를 통해 w_id를 찾아 삭제한다. 
		String viewPage ="";
		WishlistDAO dao = new WishlistDAO();
		
		HttpSession session = request.getSession();
		//id = session.getAttribute("id",id); 머지 후 세션으로 아이디받아오기 
		String id ="hong";
		String e_id  = request.getParameter("e_id");
		
		System.out.println("전달받은 e_id"+e_id);
		if(e_id != null){
			
				int re = dao.deleteMyWish(e_id,id);
				
				if(re!=1) {
					System.out.println("삭제실패");
					viewPage = "/jsp/user/deleteError.jsp";    
					
				}else {
					System.out.println("삭제성공");
					viewPage = "/jsp/user/deleteMyWishlistComplete.jsp";    // 시작경로는 wepapp을기준으로 한다. 
				}
			}
		
		
		request.setAttribute("viewPage", viewPage);
		
		return viewPage;
		
		}
		
		
	}


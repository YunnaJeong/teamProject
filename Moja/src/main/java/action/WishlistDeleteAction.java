package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.WishlistDAO;

public class WishlistDeleteAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int e_id = Integer.parseInt(request.getParameter("e_id"));
//		String u_id = request.getParameter("id");
		
		System.out.println("삭제돌아감");
		HttpSession session = request.getSession();
		//String u_id = request.getParameter("id");
		String id = (String)session.getAttribute("id");

		WishlistDAO wishlistDAO = new WishlistDAO();
		int result = wishlistDAO.deleteWishlist(id, e_id);

		if (result > 0) {
			System.out.println("위시리스트에서 레코드가 성공적으로 삭제되었습니다.");
		} else {
			System.out.println("위시리스트에서 레코드를 삭제하는 중에 오류가 발생했습니다.");
		}
			new CertiDetailAction().pro(request, response);
		return "certificationDetail.jsp";
	}

}

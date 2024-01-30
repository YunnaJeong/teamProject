package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.WishlistDAO;
import vo.WishlistVO;

public class WishlistInsertAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int e_id = Integer.parseInt(request.getParameter("e_id"));
		HttpSession session = request.getSession();
		//String u_id = request.getParameter("id");
		String id = (String)session.getAttribute("id");

		WishlistVO w = new WishlistVO();
		w.setU_id(id);
		w.setE_id(e_id);
		System.out.println(id);
		System.out.println(e_id);
		
		WishlistDAO wishlistdao = new WishlistDAO();
		int result = wishlistdao.insertWishlist(w);
		CertiDetailAction c = new CertiDetailAction();
		c.pro(request, response);

		if (result > 0) {
			return "certificationDetail.jsp";
		} else {
			return "error.jsp"; 
		}
	}

}

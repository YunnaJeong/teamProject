package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import vo.UserVO;

public class AdminUserDetailAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String u_id = request.getParameter("u_id");
		UserDAO dao = new UserDAO();
		UserVO u = dao.usersDetail(u_id);
		
		request.setAttribute("u", u);
		return "detailUser.jsp";
	}

}

package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

public class AdminUserDeleteAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String u_id = request.getParameter("u_id");
		UserDAO dao = new UserDAO();
		dao.usersDelete(u_id);
		AdminUserListAction a = new AdminUserListAction();
		a.pro(request, response);
		return "user.jsp";
	}

}

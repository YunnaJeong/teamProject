package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnaDAO;
import dao.UserDAO;

public class AdminUserAllDeleteAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] id_arr = request.getParameterValues("del_id");
		
		for (String s: id_arr) {
			System.out.println(s);
		}
		UserDAO dao = new UserDAO();
		dao.userAllDelete(id_arr);
		AdminUserListAction a = new AdminUserListAction();
		a.pro(request, response);
		return "user.jsp";
	}
}

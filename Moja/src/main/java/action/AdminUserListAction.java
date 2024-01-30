package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import vo.UserVO;

public class AdminUserListAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		ArrayList<UserVO> list = dao.usersList();
		request.setAttribute("list", list);
		
		return "user.jsp";
	}

}

package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

public class PwFindOKAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage="pwFindOK.jsp";
		UserDAO dao = new UserDAO();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		String pwd = dao.pwFind(id,name);
		if(pwd==null) {
			request.setAttribute("msg", "찾으시는 비밀번호가 없습니다");
			viewPage="error.jsp";
			request.setAttribute("msg1", "PW찾기");
		}
		request.setAttribute("findpw", pwd);
		return viewPage;
	}

}

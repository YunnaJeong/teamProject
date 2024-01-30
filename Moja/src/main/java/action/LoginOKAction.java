package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;

public class LoginOKAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String viewPage="loginOK.jsp";
		UserDAO dao = new UserDAO();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println("id:"+id+" pwd:"+pwd);
		String u_id=dao.login(id, pwd);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("id", u_id);
		System.out.println(u_id);

		if(u_id==null) {
			viewPage="error.jsp";
			request.setAttribute("msg", "로그인 정보가 없습니다");
			request.setAttribute("loginAgain", "로그인");
		}
		
		
		
		System.out.println(session.getAttribute("id"));
		return viewPage;
		
		
	}

}

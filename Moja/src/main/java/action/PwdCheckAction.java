package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import vo.UserVO;

public class PwdCheckAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("PwdCheckAction실행" );
		String viewPage = "/jsp/user/pwdCheck.jsp";   
		request.setAttribute("viewPage", viewPage);
		request.setAttribute("invalid", "invalid");
		
		
		
		return viewPage;
	}

}

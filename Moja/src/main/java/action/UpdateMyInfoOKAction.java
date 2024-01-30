package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

public class UpdateMyInfoOKAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String viewPage ="";
		
		String u_id =request.getParameter("u_id");
		String u_pwd =request.getParameter("u_pwd");
		String u_name =request.getParameter("u_name");
		String u_phone =request.getParameter("u_phone");
		String u_addr =request.getParameter("u_addr");
		UserDAO dao = new UserDAO();
		int re = dao.updateUserInfo(u_id,u_pwd,u_name,u_phone,u_addr);
		
		if(re == 1) {
			//정보변경에 성공시 //
			viewPage = "/jsp/user/UpdateMyInfoComplete.jsp";   
		
			
		}else {
			//정보변경 실패시 // 
		     viewPage = "/jsp/user/updateMyInfoError.jsp" ;  // 시작경로는 wepapp을기준으로 한다. 
			
		}
		
		
		
		request.setAttribute("viewPage", viewPage);
		
		
		return viewPage;
	}

}

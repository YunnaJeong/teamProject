package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import vo.UserVO;

public class CheckPwdOKAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String viewPage ="";
		
		String id = ""; 
//		id = "hong"; //임시값 나중에 지움//
		String invalid = null;
		
		String pwd = request.getParameter("pwd");

		HttpSession session = request.getSession();
		id = (String) session.getAttribute("id");// 머지 후 세션으로 아이디받아오기 
		
		UserDAO userdao = new UserDAO();
		// 전달받은 id를 통해 회원정보를 가져오는 매소드 실행.//
		UserVO u = userdao.myInfo(id);
		String u_pw = u.getU_pw();
		
		if(pwd.equals(u_pw)) {
			
			 viewPage = "/jsp/user/updateMyInfo.jsp";    // 시작경로는 wepapp을기준으로 한다. 
			
			request.setAttribute("id", u.getU_id());
			request.setAttribute("u_pw",u_pw);
			request.setAttribute("u_name",u.getU_name());
			request.setAttribute("u_phone",u.getU_phone());
			request.setAttribute("u_addr",u.getU_addr());
			request.setAttribute("viewPage", viewPage);
			
		}else {
			 viewPage = "/jsp/user/pwdCheck.jsp";   
			System.out.println("패스워드가 틀림");
			request.setAttribute("viewPage", viewPage);
			invalid = "N";
			request.setAttribute("invalid", invalid);
		}
		
	
		return viewPage;
	}

}

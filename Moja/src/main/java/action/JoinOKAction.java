package action;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import vo.UserVO;

public class JoinOKAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage="joinOK.jsp";
		UserVO vo ;
		UserDAO dao = new UserDAO();
		int re = -1; 
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone4 = phone1+"-"+phone2+"-"+phone3;
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String birth = year+month+day;
		
		
		
		
	
		String addr2 = request.getParameter("address2"); 
		String addr4 = request.getParameter("address4"); 
		String interest = request.getParameter("interest");

		String addr = addr2+" "+addr4;

		
		System.out.println("interest : " +interest);
		
		vo = new UserVO(id, pwd, name, birth, phone4, addr, interest);
		re = dao.joinUser(vo);
		if(re!=1) {
			System.out.println("회원가입 실패");
		}
		
		
		
		
		return viewPage;
	}

}

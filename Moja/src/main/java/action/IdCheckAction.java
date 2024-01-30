package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

public class IdCheckAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage="idCheck.jsp";
		String id = request.getParameter("id");
		System.out.println("IdCheckAction : " + id);
		request.setAttribute("id", id);
		UserDAO dao = new UserDAO();
		int check = dao.idValidate(id);
		
		if(check==1) {
			request.setAttribute("msg", "는 사용할 수 있습니다");
		}
		else if(check==0){
			request.setAttribute("msg", "는 사용할 수 없습니다");
		}
		return viewPage;
		
	}

}

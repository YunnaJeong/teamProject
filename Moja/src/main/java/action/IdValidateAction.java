package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

public class IdValidateAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = "idValidate.jsp";
		UserDAO dao = new UserDAO();
		
		int re=0;
		String id = request.getParameter("userID");		
		re=dao.idValidate(id);
		
		System.out.println(re);
		
		return viewPage;
	}

}

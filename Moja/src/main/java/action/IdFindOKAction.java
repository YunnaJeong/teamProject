package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.jni.User;

import dao.UserDAO;

public class IdFindOKAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage="idFindOK.jsp";
		UserDAO dao = new UserDAO();
		String name = request.getParameter("name");
		String phone = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
		
		String u_id = dao.idFind(name, phone);
		if(u_id==null) {
			request.setAttribute("msg", "찾으시는 아이디가 없습니다");			
			viewPage="error.jsp";
			request.setAttribute("msg1", "ID찾기");
		}
		request.setAttribute("findId", u_id);
		return viewPage;
		
		
	}

}

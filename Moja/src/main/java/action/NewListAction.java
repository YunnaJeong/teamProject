package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.NewDAO;
import vo.NewVO;

public class NewListAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NewDAO newdao = new NewDAO();
		String u_id = "";
		HttpSession session = request.getSession();
		if(session.getAttribute("id")!=null) {
			u_id = (String)session.getAttribute("id");
			ArrayList<NewVO> newList = newdao.findAllNew(u_id);
			if(newList!=null) {
				session.setAttribute("newList", newList);
			}
		}
		return "";
	}

}

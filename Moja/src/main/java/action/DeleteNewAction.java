package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NewDAO;

public class DeleteNewAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NewDAO ndao = new NewDAO();
		int n_id = Integer.parseInt(request.getParameter("n_id"));
		System.out.println(n_id);
		ndao.deleteNew(n_id);
		new HomepageAction().pro(request, response);
		return "homepage.jsp";
	}

}

package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NewDAO;

public class NewInsertAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NewDAO ndao = new NewDAO();
		System.out.println("댓글 작성 시 알림 작동함");
		int s_id = Integer.parseInt(request.getParameter("s_id"));
		System.out.println("s_id  :  "+s_id);
		ndao.insertNewReply(s_id);
		return null;
	}

}

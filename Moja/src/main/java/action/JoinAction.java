package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.ExamDAO;

public class JoinAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = "join.jsp";
		Gson gson = new Gson();
		ExamDAO dao = new ExamDAO();
		request.setAttribute("list", gson.toJson(dao.mdobligfldnmList()));
		return viewPage;
	}

}

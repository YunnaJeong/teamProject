package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InquiryDAO;
import dao.QnaDAO;

public class AdminInquiryAllDeleteAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] id_arr = request.getParameterValues("del_id");
		
		InquiryDAO dao = new InquiryDAO();
		dao.inquiryAllDelete(id_arr);
		
		AdminInquiryListAction a = new AdminInquiryListAction();
		a.pro(request, response);
		return "inquiry.jsp";
	}
}

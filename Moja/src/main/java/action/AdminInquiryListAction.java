package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InquiryDAO;
import vo.InquiryVO;

public class AdminInquiryListAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InquiryDAO dao = new InquiryDAO();
		ArrayList<InquiryVO> list = dao.inquiryList();
		request.setAttribute("list", list);
		return "inquiry.jsp";
	}

}

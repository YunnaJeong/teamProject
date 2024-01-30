package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InquiryDAO;
import vo.InquiryVO;

public class AdminInquiryDetailAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = "detailInquiry.jsp";
		String comment = null;
		int i_id = Integer.parseInt(request.getParameter("i_id"));
		InquiryDAO dao = new InquiryDAO();
		InquiryVO vo = dao.inquiryDetail(i_id);
		
		if (vo == null) {
			viewPage = "inquiry.jsp";
		}
		
		if (request.getParameter("floatingTextarea") != null) {
			comment = request.getParameter("floatingTextarea");
		}
		
		request.setAttribute("vo", vo);
		request.setAttribute("answer", comment);
		
		return "detailInquiry.jsp";
	}

}

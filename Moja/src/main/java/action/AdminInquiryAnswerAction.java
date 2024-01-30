package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InquiryDAO;
import vo.InquiryVO;

public class AdminInquiryAnswerAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String answer = request.getParameter("floatingTextarea");
		int i_id = Integer.parseInt(request.getParameter("i_id"));
		InquiryDAO dao = new InquiryDAO();
		int re = dao.inquiryAnswer(i_id, answer);
		InquiryVO vo = dao.inquiryDetail(i_id);
		
		request.setAttribute("vo", vo);
		AdminInquiryDetailAction a = new AdminInquiryDetailAction();
		a.pro(request, response);
		
		return "detailInquiry.jsp";
	}

}

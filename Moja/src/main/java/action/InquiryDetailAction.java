package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InquiryDAO;
import dao.QnaDAO;
import vo.InquiryVO;
import vo.QnaVO;

public class InquiryDetailAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String viewPage = "inquiryDetail.jsp";
		InquiryDAO dao=new InquiryDAO();
		int i_id=
			Integer.parseInt(request.getParameter("i_id"));	
		InquiryVO vo = new InquiryVO();
		vo= dao.inquiryDetail(i_id);
		request.setAttribute("inquiry1", vo);
		
		return viewPage;
	}

}

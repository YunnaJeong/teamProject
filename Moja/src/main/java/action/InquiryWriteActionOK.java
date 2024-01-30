package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.InquiryDAO;

public class InquiryWriteActionOK implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String inquiryTitle = "";
		String inquiryContent ="";
		if(request.getParameter("inquiryTitle")!=null) {
			inquiryTitle = request.getParameter("inquiryTitle");
		}
		if(request.getParameter("inquiryContent")!=null) {
			inquiryContent = request.getParameter("inquiryContent");
		}
		HttpSession session = request.getSession();
		String u_id = (String)session.getAttribute("id");
		InquiryDAO dao = new InquiryDAO();
		
		System.out.println("inquiryTitle : "+inquiryTitle+ " inquiryContent : "+ inquiryContent);
		dao.writeInquiry(inquiryTitle, inquiryContent, u_id);
		
		new InquiryListAction().pro(request, response);
		return "inquiryList.jsp";
	}

}

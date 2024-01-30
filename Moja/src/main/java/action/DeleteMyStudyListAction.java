package action;

import java.io.IOException;
import java.net.http.HttpRequest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InquiryDAO;
import dao.StudyDAO;
import vo.InquiryVO;

public class DeleteMyStudyListAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("daleteStudyAction작동");
		StudyDAO dao = new StudyDAO();
		String viewPage ="";
		String [] s_ids  = request.getParameterValues("checkedId");
		
		for (String s_id : s_ids) {
			System.out.println("전달받은 s_id: "+s_id);
			}
		
		if(s_ids != null){
			for (String s_id : s_ids) {
				System.out.println(s_id);
				int re = dao.deleteMyStudy(s_id);
				
				if(re!=1) {
					System.out.println("삭제실패");
					viewPage = "/jsp/user/deleteError.jsp"; 
				}else {
					System.out.println("삭제성공");
				    viewPage = "/jsp/user/deleteMyStudyComplete.jsp";   
				}
			}
		}
		
		request.setAttribute("viewPage", viewPage);

		
		return viewPage;
	}

}

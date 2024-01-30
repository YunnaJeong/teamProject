package action;

import java.io.IOException;
import java.net.http.HttpRequest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InquiryDAO;
import vo.InquiryVO;

public class DeleteMyInquireListAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String viewPage ="";
		InquiryDAO dao = new InquiryDAO();
		// 체크박스 표시된 문의 항목들의 i_id들을 가져온다. 이때 배열로 가져옴.
		String [] i_ids  = request.getParameterValues("checkedId");
		
		// 버그잡는용도 나중에 지우기 //
		for (String i_id : i_ids) {
			System.out.println("전달받은 i_id: "+i_id);
			}
		
		//루프를 돌아 배열의 있는 i_id의 갯수만큼 delete매소드 실행//
		if(i_ids != null){
			for (String i_id : i_ids) {
				System.out.println(i_id);
				int re = dao.deleteMyInquire(i_id);
				
				if(re!=1) {
					System.out.println("삭제실패");
					viewPage = "/jsp/user/deleteError.jsp";    
				}else {
					System.out.println("삭제성공");
				   viewPage = "/jsp/user/deleteMyInquireComplete.jsp";   
				}
			}
		}
		
		   
		request.setAttribute("viewPage", viewPage);

		
		return viewPage;
	}

}

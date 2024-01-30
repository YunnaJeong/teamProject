package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateMyInfoAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String viewPage = "/jsp/updateMyInfo.jsp";    // 시작경로는 wepapp을기준으로 한다. 
		
		request.setAttribute("viewPage", viewPage);
		
		return viewPage;
	}

}

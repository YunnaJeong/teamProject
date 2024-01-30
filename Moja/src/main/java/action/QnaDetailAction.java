package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnaDAO;
import vo.QnaVO;

public class QnaDetailAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String viewPage = "qnaDetail.jsp";
		QnaDAO dao=new QnaDAO();
		int q_id=
			Integer.parseInt(request.getParameter("q_id"));	
		ArrayList<QnaVO> vo = new ArrayList<QnaVO>();
		vo= dao.qnaList2(q_id);
		request.setAttribute("qna1", vo);
		
		
		return viewPage;

	}

}

package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnaDAO;
import vo.QnaVO;

public class QnaListAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = "qnaList.jsp";
		QnaDAO dao=new QnaDAO();
		ArrayList<QnaVO> vo = new ArrayList<QnaVO>();
		vo= dao.qnaList();
		request.setAttribute("qna1", vo);
		
		return viewPage;

	}

}

package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.ExamDAO;

public class ExamSearchAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage="examSearch.jsp";
		int pageNum=1;
		String search = null;
		String bCate = null;
		HttpSession session = request.getSession();
		
		if(session.getAttribute("bCate")  != null) {
			bCate = (String)session.getAttribute("bCate");
		}
		
		if(request.getParameter("bCate")!=null) {			
			bCate = request.getParameter("bCate");
			session.setAttribute("bCate", bCate);
		}
		
		if(session.getAttribute("search")  != null) {
			search = (String)session.getAttribute("search");
		}
		
		
		if(request.getParameter("search")!=null) {			
			search = request.getParameter("search");
			session.setAttribute("search", search);
		}
		if(request.getParameter("pageNum")!=null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			}
		System.out.println("search : " + search);
		System.out.println("bCate : " + bCate);
		ExamDAO dao = new ExamDAO();
		Gson gson = new Gson();
		request.setAttribute("cnt", dao.totalExamCount());//전체 시험 수를 유지
		request.setAttribute("list", dao.pagingExam(pageNum,search,bCate));//전체 자격증 정보 출력
		request.setAttribute("totalPage", dao.totalPage);
		request.setAttribute("sCate", gson.toJson(dao.mdobligfldnmList()));//중직무분야명 목록출력
		request.setAttribute("bCate", gson.toJson(dao.obligfldnmList()));
		return viewPage;
	}

}
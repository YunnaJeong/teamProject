package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.InquiryDAO;
import dao.StudyDAO;
import vo.InquiryVO;
import vo.StudyVO;

public class InquiryListAction implements SistAction {

   @Override
   public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      System.out.println("inquiryListAction실행" );
      HttpSession session = request.getSession();
      //id = session.getAttribute("id",id); 머지 후 세션으로 아이디받아오기 
      
      int pageNUM =1;
      if(request.getParameter("pageNUM")!=null) {
         pageNUM =Integer.parseInt(request.getParameter("pageNUM"));
      }
      System.out.println("페이지번호:"+pageNUM);
      
      InquiryDAO dao = new InquiryDAO();
      ArrayList<InquiryVO> list = dao.InquiryList(pageNUM);
      


      String viewPage = "inquiryList.jsp";
         
      request.setAttribute("list", list);
      request.setAttribute("totalPage",dao.totalPage );
      request.setAttribute("viewPage", viewPage);
      return viewPage;
   
   }

   
}

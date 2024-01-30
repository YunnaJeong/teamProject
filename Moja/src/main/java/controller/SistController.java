package controller;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.SistAction;

/**
 * Servlet implementation class SistController
 */
@WebServlet("*.do")
public class SistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       HashMap<String, SistAction> map;

	@Override
	public void init(ServletConfig config) throws ServletException {
    	map= new HashMap<String, SistAction>();
    	String path = config.getServletContext().getRealPath("WEB-INF");
    	try {
    		FileReader fr = new FileReader(path + "/sist.properties");
    		Properties prop = new Properties();
    		prop.load(fr);
    		Set keyList = prop.keySet();
    		Iterator iter = keyList.iterator();
    		while(iter.hasNext()) {
    			String key = (String)iter.next();
    			String clsName = prop.getProperty(key);
    			Object obj = Class.forName(clsName).newInstance();
    			map.put(key,(SistAction)obj);
    		}
    		fr.close();
    	}catch(Exception e) {
    		System.out.println(e.getMessage());
    	}
	}
    public SistController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		String cmd = uri.substring(uri.indexOf("/",1)+1);

		SistAction action = map.get(cmd);
		String viewPage = action.pro(request, response);
		request.setAttribute("viewPage", viewPage);
		request.setAttribute("admin", "admin");

		RequestDispatcher dispatcher = request.getRequestDispatcher("template.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
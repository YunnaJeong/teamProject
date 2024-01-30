<%@page import="java.io.PrintWriter"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserDAO dao = new UserDAO();
	
	String userID = request.getParameter("userID");
	String str;
	int re = dao.idValidate(userID);
	
	if(re==1){
		str="YES";
		out.print(str);
	}else{
		str="NO";
		out.print(str);
	}
%>


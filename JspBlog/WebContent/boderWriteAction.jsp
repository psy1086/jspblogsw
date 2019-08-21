<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boder.BoderDTO"%>
<%@ page import="boder.BoderDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	String userId = null;
	if(session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
	if(userId == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 후 가능합니다')");
		script.println("location.href='userLogin.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	String boderTitle = null;
	String boderContent = null;
	
	if(request.getParameter("userId") != null) {
		userId= request.getParameter("userId");
	}
	if(request.getParameter("boderTitle") != null) {
		boderTitle= request.getParameter("boderTitle");
	}
	if(request.getParameter("boderContent") != null ) {
		boderContent = request.getParameter("boderContent");
	}
	
	if(boderTitle == null || boderContent == null || boderTitle.equals("") || boderContent.equals("")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이안된사항이있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	BoderDAO boderDAO = new BoderDAO();
	int result = boderDAO.write(new BoderDTO(0,userId, boderTitle, boderContent , null, 0));
	if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('실패!');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	else {
		session.setAttribute("userId", userId);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='boder.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	UserDAO userDAO = new UserDAO();
	
	String code = null;
	String userId = null;
	
	if(request.getParameter("code") != null) {
		code = request.getParameter("code");
	}
	
	if(session.getAttribute("userId") != null) {
		userId = (String)session.getAttribute("userId");
	}
	if(userId == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 후 이용해 주세요.');");
		script.println("history.href = 'userLogin.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
	String userEmail = userDAO.getUserEmail(userId);
	boolean isRight = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false; 
	
	if(isRight == true) {
		userDAO.setUserEmailChecked(userId);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증완료.');");
		script.println("location.href = 'index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	if(isRight == false) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증실패.');");
		script.println("location.href = 'index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
%>
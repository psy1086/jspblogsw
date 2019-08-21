<%@page import="mypage.MyPageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
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
		script.println("alert('로그인')");
		script.println("location.href='index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	String userName = null;
	String userPassword = null;
	String userEmail = null;
	
	if(request.getParameter("userPassword") != null) {
		userPassword= request.getParameter("userPassword");
	}
	if(request.getParameter("userName") != null) {
		userName = request.getParameter("userName");
	}
	if(request.getParameter("userEmail") != null) {
		userEmail= request.getParameter("userEmail");
	}
	
	if(userPassword == null || userName == null || userEmail == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이안된사항이있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	MyPageDAO mypageDAO = new MyPageDAO();
	int result = mypageDAO.setReWrite(userName, userPassword, userEmail, userId);
	if(result == -1)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Err..');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	else
	{
		session.setAttribute("userId", userId);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('변경완료.');");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>
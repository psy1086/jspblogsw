<%@page import="mypage.MyPageDAO"%>
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

	if(request.getParameter("userId") != null) {
		userId= request.getParameter("userId");
	}
	
	MyPageDAO mypageDAO = new MyPageDAO();
	int result = mypageDAO.secession(userId);
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
		script.println("alert('탈퇴!');");
		script.println("location.href='userLogoutAction.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>
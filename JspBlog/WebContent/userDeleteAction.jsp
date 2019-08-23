<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="boder.BoderDAO" %>
<%@ page import="java.io.PrintWriter"%>

<%
	String userId = null;
	if(session.getAttribute("userId") != null) {
		userId = (String)session.getAttribute("userId");
	}
	if(userId == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 후 사용 가능합니다.');");
		script.println("location.href='userLogin.jsp';");
		script.println("</script>");
		script.close();
		return;
	}if(!(userId.equals("admin")) ) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		System.out.println(userId);
		script.println("alert('관리자만 사용 가능합니다.');");
		script.println("location.href='userLogin.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
	request.setCharacterEncoding("UTF-8");
	String user = null;	
	if(request.getParameter("user") != null) {
		user = request.getParameter("user");
	}

	UserDAO userDAO = new UserDAO();
	
	if(userId.equals("admin")) {
		if(user.equals("admin")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('관리자입니다.');");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		}
		int result = new UserDAO().delete(user);
		if(result == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제완료.');");
			script.println("location.href='tables.jsp'");
			script.println("</script>");
			script.close();
			return;
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('DB오류!!!');");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		}
	}else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('관리자만 삭제 가능합니다.');");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
%>
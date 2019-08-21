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
	}
	
	request.setCharacterEncoding("UTF-8");
	String boderId = null;	
	if(request.getParameter("boderId") != null) {
		boderId = request.getParameter("boderId");
	}

	BoderDAO boderDAO = new BoderDAO();
	
	if(userId.equals(boderDAO.getUserId(boderId))) {
		int result = new BoderDAO().delete(boderId);
		if(result == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제완료.');");
			script.println("location.href='boder.jsp'");
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
		script.println("alert('작성자만 삭제 가능합니다.');");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
%>
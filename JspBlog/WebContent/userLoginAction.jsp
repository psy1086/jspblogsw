<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	String userId = null;
	String userPassword = null;

	if(session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
	if(userId != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 된 상태입니다')");
		script.println("location.href='index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
	if(request.getParameter("userId") != null) {
		userId= request.getParameter("userId");
	}
	if(request.getParameter("userPassword") != null) {
		userPassword= request.getParameter("userPassword");
	}
	
	if(userId == null || userPassword == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이안된사항이있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(userId, userPassword);
	if(result == 1) {
		session.setAttribute("userId", userId);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	else if(result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호 오류')");
		script.println("location.href='userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
	else if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('ID오류')");
		script.println("location.href='userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
	else if(result == -2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB오류')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
%>
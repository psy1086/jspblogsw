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
	if(userId != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 된 상태입니다')");
		script.println("location.href='index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	String userName = null;
	String userPassword = null;
	String userEmail = null;
	if(request.getParameter("userId") != null) {
		userId= request.getParameter("userId");
	}
	if(request.getParameter("userPassword") != null) {
		userPassword= request.getParameter("userPassword");
	}
	if(request.getParameter("userName") != null) {
		userName = request.getParameter("userName");
	}
	if(request.getParameter("userEmail") != null) {
		userEmail= request.getParameter("userEmail");
	}
	
	if(userId == null || userPassword == null || userName == null || userEmail == null || userId.equals("") || userPassword.equals("") || userName.equals("") || userEmail.equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이안된사항이있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(new UserDTO(userId, userPassword, userName, userEmail, SHA256.getSHA256(userEmail),false));
	if(result == -1)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.');");
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
		script.println("location.href='emailSendAction.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>
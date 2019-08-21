<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mypage.MyPageDAO"%>
<%@ page import="mypage.MyPageDTO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	String userId = null;
	String userPassword = null;

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
	
	if(request.getParameter("userId") != null) {
		userId= request.getParameter("userId");
	}
	if(request.getParameter("userPassword") != null) {
		userPassword= request.getParameter("userPassword");
	}
	
	if(userPassword == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호입력.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	MyPageDAO mypageDAO = new MyPageDAO();
	int result = mypageDAO.mylogin(userId, userPassword);
	if(result == 1) {
		session.setAttribute("userId", userId);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='myPageIndex.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	else if(result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호 오류')");
		script.println("location.href='myPage.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
	else if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('ID오류')");
		script.println("location.href='index.jsp'");
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
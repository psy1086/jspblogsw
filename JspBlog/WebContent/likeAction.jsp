<%@page import="java.net.InetAddress"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="likey.LikeyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="boder.BoderDAO" %>
<%@ page import="likey.LikeyDTO" %>
<%@ page import="java.io.PrintWriter"%>

<%
	String ipAddr = null;

	ipAddr = request.getRemoteAddr();
	if(ipAddr == null) {
		String header=request.getHeader("X-Forwarded-For");
		String ipAddress=new StringTokenizer(header, ",").nextToken().trim();
	}
	if(ipAddr == null) {
		if(ipAddr.equalsIgnoreCase("0:0:0:0:0:0:0:1")){
		    InetAddress inetAddress=InetAddress.getLocalHost();
		    ipAddr=inetAddress.getHostAddress();
		}
	}

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
	String reportContent = null;	
	if(request.getParameter("boderId") != null) {
		boderId = request.getParameter("boderId");
	}
	System.out.print(boderId);
	BoderDAO boderDAO = new BoderDAO();
	LikeyDAO likeyDAO = new LikeyDAO();
	int result = likeyDAO.like(userId, boderId, ipAddr);
	System.out.println(result);
	if(result == 1) {
		result = boderDAO.like(boderId);
		if(result == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('추천완료.');");
			script.println("location.href='boder.jsp'");
			script.println("</script>");
			script.close();
			return;
		}else {
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
		script.println("alert('이미 추천한 글입니다.");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}

%>
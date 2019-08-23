<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.Address"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Authenticator"%>
<%@ page import="java.util.Properties" %>
<%@ page import="user.UserDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="util.Gmail" %>
<%@ page import="java.io.PrintWriter"%>

<%
	UserDAO userDAO = new UserDAO();

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

	boolean emailChecked = userDAO.getUserEmailChecked(userId);
	if(emailChecked == true) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 인증된 회원입니다.');");
		script.println("location.href='index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
	String host = "http://localhost:8092/JspBlog/";	// 웹 주소
	String from = "andrea122245@gmail.com"; // 구글이메일계정
	String to = userDAO.getUserEmail(userId);
	String subject = "강의평가를 위한 이메일 인증 메일입니다.";
	String content = "인증을 진행하시려면 다음 링크를 눌러주세요" +
	 "<a href='" + host + "emailCheckAction.jsp?code=" + new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";
	
	//프로퍼티 값 설정
	Properties p = new Properties();
	p.put("mail.smtp.user", from);
	p.put("mail.smtp.host", "smtp.googlemail.com"); // 구글 이메일 
	p.put("mail.smtp.prot", 465); // 구글서비스에서 제공하는 기본 포트
	p.put("mail.smtp.starttls.enalbe", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", 465);	// 구글 서비스에서 제공하는 기본 포트
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
		
	try {
		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(p,auth);
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.setRecipient(Message.RecipientType.TO, toAddr);
		msg.setContent(content, "text/html;charset=UTF8");
		Transport.send(msg);
	}catch(Exception e) {
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류발생!!');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	String addr = null;
	String add = null;

	addr = userDAO.getUserEmail(userId);
	int idx = addr.indexOf("@"); 
	addr = addr.substring(idx+1);
%>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<jsp:include page="navbar.jsp" flush="false"/>

	<section class="container mt-3" style="max-width:560px;">
		<div class="alert alert-success mt-4" role="alert">
			<a href="http://"<%= addr %>>이메일 인증 메일 전송이 되었습니다. 확인하러 가기</a>
		</div>
	</section>
	
<jsp:include page="footer.jsp" flush="false"/>

	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>
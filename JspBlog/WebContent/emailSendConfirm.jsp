<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>JSP Blog</title>
	<link rel="stylesheet" href="./css/bootstrap.css">
</head>
<body>
<%
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

%>  
<jsp:include page="navbar.jsp" flush="false"/>

	<section class="container mt-3" style="max-width:560px;">
		<div class="alert alert-warning mt-4" role="alrer">
			이메일 주소 인증을 하셔야 합니다. 메일 인증을 하시겠습니까?
		</div>
		<a href="emailSendAction.jsp" class="btn btn-primary">인증</a>
	</section>
	
<jsp:include page="footer.jsp" flush="false"/>

	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>
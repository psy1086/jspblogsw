<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="boder.BoderDTO" %>
<%@ page import="boder.BoderDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
<title>JSP Blog</title>

	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/heroic-features.css" rel="stylesheet">
</head>
<body>
<%
	String userId = null;

	if(session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="./index.jsp">JSP Blog</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="./index.jsp">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./main.jsp">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./boder.jsp">Boder</a>
          </li>
				
			<li class="nav-item dropdown">
          	<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">메뉴</a>
				<div class="dropdown-menu" aria-labelledby="dropdown">
					<a class="dropdown-item" href="#">서브1</a>
					<a class="dropdown-item" href="#">서브2</a>
					<a class="dropdown-item" href="#">서브3</a>
					<a class="dropdown-item" href="#">서브4</a>
					<a class="dropdown-item" href="./myPage.jsp">MyPage</a>
				</div>
			</li>
          <li class="nav-item">
          <% if(userId != null) { %>
            <a class="nav-link" href="./userLogoutAction.jsp">Logout</a>
          <%} %>
          <% if(userId == null) { %>
			<a class="nav-link" href="./userLogin.jsp">Login</a>
		  <%} %>
          </li>
        </ul>
      </div>
    </div>
  </nav>
	
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
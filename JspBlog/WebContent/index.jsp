<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	request.setCharacterEncoding("UTF-8");
	String userId = null;
	if(session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
%>
	<jsp:include page="navbar.jsp" flush="false" />
	
	<div class="container">
		<header class="jumbotron my-4">
			<h1 class="display-3">메인화면 첫번째</h1>
			<p class="lead">설명입니다</p>
			<a href="main.jsp" class="btn btn-primary btn-lg">main</a>
		</header>

		<div class="row text-center">
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="http://placehold.it/500x325" alt="">
						<div class="card-body">
							<h4 class="card-title">메인 서브1</h4>
							<p class="card-text">메인 서브1</p>
						</div>
						<div class="card-footer">
							<a href="#" class="btn btn-primary">바로가기</a>
						</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="http://placehold.it/500x325" alt="">
						<div class="card-body">
							<h4 class="card-title">메인 서브2</h4>
							<p class="card-text">메인 서브2</p>
						</div>
						<div class="card-footer">
							<a href="#" class="btn btn-primary">바로가기</a>
						</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="http://placehold.it/500x325" alt="">
						<div class="card-body">
							<h4 class="card-title">메인 서브3</h4>
							<p class="card-text">메인 서브3</p>
						</div>
						<div class="card-footer">
							<a href="#" class="btn btn-primary">바로가기</a>
						</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="http://placehold.it/500x325" alt="">
						<div class="card-body">
							<h4 class="card-title">메인 서브4</h4>
							<p class="card-text">메인 서브4</p>
						</div>
						<div class="card-footer">
							<a href="#" class="btn btn-primary">바로가기</a>
						</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<a href="#">
                		<i class="fab fa-instagram fa-2x fa-fw"></i>
             		</a>
					<div class="card-body">
						<p class="card-text">Instagram</p>
					</div>
					<div class="card-footer">
						<a href="https://instagram.com" class="btn btn-primary">바로가기</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<a href="#">
                		<i class="fab fa-twitter-square fa-2x fa-fw"></i>
             		</a>
					<div class="card-body">
						<p class="card-text">Twitter</p>
					</div>
					<div class="card-footer">
						<a href="https://twitter.com" class="btn btn-primary">바로가기</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<a href="#">
                		<i class="fab fa-facebook fa-2x fa-fw"></i>
             		</a>
					<div class="card-body">
						<p class="card-text">Facebook</p>
					</div>
					<div class="card-footer">
						<a href="https://fb.com" class="btn btn-primary">바로가기</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<a href="#">
                		<i class="fab fa-github fa-2x fa-fw"></i>
             		</a>
					<div class="card-body">
						<p class="card-text">Github</p>
					</div>
					<div class="card-footer">
						<a href="https://github.com" class="btn btn-primary">바로가기</a>
					</div>
				</div>
			</div>
			
		</div>
	</div>

	<jsp:include page="footer.jsp" flush="false" />
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
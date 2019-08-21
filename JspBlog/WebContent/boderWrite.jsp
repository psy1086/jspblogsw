<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>JSP Blog</title>
	
	<link href="css/custom.css" rel="stylesheet">
	<link href="css/boder.css" rel="stylesheet">

</head>
<body>
		<jsp:include page="navbar.jsp" flush="false"/>
	<div class="container">
		<header class="jumbotron my-4">
		</header>
		<div class="container-fluid">
			<div class="row no-gutter">
				<div class="col-md-8 col-lg-6">
					<h3 class="login-heading mb-4">Write</h3>
					<form method="post" action="./boderWriteAction.jsp">
						<div class="form-label-group">
							<input type="text" name="boderTitle" id="inputBoderTitle" placeholder="Title" class="boder-control" placeholder="title" required autofocus>
						</div>
			
						<div class="form-label-group">
							<textarea name="boderContent" id="inputBoderContnet" placeholder="Content" rows="20" class="boder-control" required></textarea>	
						</div>	
						<button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit">Write</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="false" />
	
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
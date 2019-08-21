<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
<title>Heroic Features - Start Bootstrap Template</title>
  <link href="css/user.css" rel="stylesheet">

</head>
<body>
<jsp:include page="navbar.jsp" flush="false"/>

  <div class="container-fluid">
  <div class="row no-gutter">
    <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex align-items-center py-5">
        <div class="container">
          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto">
              <h3 class="login-heading mb-4">Welcome back!</h3>
              <form method="post" action="userLoginAction.jsp">
                <div class="form-label-group">
                  <input type="text" name="userId" id="inputId" class="form-control" placeholder="Id" required autofocus>
                  <label for="inputId">Id</label>
                </div>

                <div class="form-label-group">
                  <input type="password" name="userPassword" id="inputPassword" class="form-control" placeholder="Password" required>
                  <label for="inputPassword">Password</label>
                </div>
                
                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit">Login</button>
                <div class="text-center">
                  <a class="small" href="userRegister.jsp">Register</a></div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
	<jsp:include page="footer.jsp" flush="false"/>
	
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
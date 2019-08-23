<%@page import="mypage.MyPageDTO"%>
<%@page import="mypage.MyPageDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>MyPage</title>


  <link href="css/user.css" rel="stylesheet">
</head>

<body id="page-top">
<%
	String userId = null;
	String userName = null;
	String userPassword = null;
	String userEmail = null;
	if(session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
	
	if(userId == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인')");
		script.println("location.href='userLogin.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
%>

  <div id="wrapper">
   <jsp:include page="myPageSidebar.jsp" flush="false"/>
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <ul class="navbar-nav ml-auto">

            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>

              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>
          </ul>
        </nav>
        <div class="container-fluid">
<%
	MyPageDTO mypageDTO = new MyPageDTO();
	
	ArrayList<MyPageDTO> myList = new ArrayList<MyPageDTO>();
	myList = new MyPageDAO().getMy(userId);
	if(myList != null)
		for(int i = 0; i < myList.size(); i++) {
			if(i == 3) break;
		mypageDTO = myList.get(i);
%>

          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto">
              <h3 class="login-heading mb-4">
              <%= userId %>           
             </h3>
              <form method="post" action="reNameAction.jsp">
                <div class="form-label-group">
                  <input type="text" name="userName" id="inputName" class="form-control" placeholder="Name" value="<%= mypageDTO.getUserName()%>" required autofocus>
                  <label for="inputId">Name</label>
                </div>
                
                <div class="form-label-group">
                  <input type="text" name="userPassword" id="inputPassword" class="form-control" placeholder="Name" value="<%= mypageDTO.getUserPassword() %>" required>
                  <label for="inputId">Password</label>
                </div>
                
                <div class="form-label-group">
                  <input type="text" name="userEmail" id="inputEmail" class="form-control" placeholder="Email"  value="<%= mypageDTO.getUserEmail()%>" required>
                  <label for="inputId">Email</label>
                </div>
                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit">Changing</button>
                </form>
                <button class="btn btn-lg btn-danger btn-block btn-login text-uppercase font-weight-bold mb-2" onclick = "location.href='secessionAction.jsp'">Withdrawal</button>
              
            </div>
          </div>
      </div>
      <%} %>
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
    </div>
  </div>
 <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>

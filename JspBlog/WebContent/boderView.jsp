<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "boder.BoderDAO" %>
<%@ page import = "boder.BoderDTO" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>JSP Blog</title>

	<link href="css/boder.css" rel="stylesheet">
	<link href="css/heroic-features.css" rel="stylesheet">
	<link href="css/custom.css" rel="stylesheet">
</head>
<body>
<%
	BoderDTO boderDTO = new BoderDTO();
	BoderDAO boderDAO = new BoderDAO();
	
	String num = request.getParameter("boderId");
	int boderId = Integer.parseInt(num);

%>
	<jsp:include page="navbar.jsp" flush="false"/>
	<div class="container">
		<header class="jumbotron my-4">
		</header>
		<!-- Jumbotron Header -->
		<div class="container-fluid">
			<div class="row no-gutter">
				<div class="col-md-8 col-lg-6">
					<h3 class="login-heading mb-4">Write</h3>
					<form method="post" action="./boderWriteAction.jsp">
						<div class="form-label-group">
							<table>
							<tbody>
								<tr>
									<td> <%= boderDAO.boderView(boderId) %> </td>
								</tr>
								</tbody>
							</table>						
						</div>
						<div class="form-label-group">
							<table>
							<tbody>
								<tr>
									<td role="300"> <%= boderDAO.boderView2(boderId) %> </td>
								</tr>
								</tbody>
							</table>
						</div>	
						<a onclick="return confirm('추천하시겠습니까?')" href="./likeAction.jsp?boderId=<%= boderId %>">추천</a>
						<a onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction.jsp?boderId=<%= boderId %>">삭제</a>
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
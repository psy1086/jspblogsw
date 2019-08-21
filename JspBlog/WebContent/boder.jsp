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
	int pageNumber = 0;
	if(request.getParameter("pageNumber")!= null) {
		try {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));	
		}catch(Exception e) {
			System.out.println("검색페이지 오류");
		}
	}
%>
<jsp:include page="navbar.jsp" flush="false"/>

	<div class="container">
		<header class="jumbotron my-4">
		</header>
		<h2>게시판</h2>
		<table class="table talbe-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>추천</th>
				</tr>
			</thead>
<%
	ArrayList<BoderDTO> boderList = new ArrayList<BoderDTO>();
	boderList = new BoderDAO().getList(pageNumber);
	if(boderList != null)
			for(int i = 0; i < boderList.size(); i++) {
				if(i == 5) break;
			BoderDTO boderDTO = boderList.get(i);		
%>
			<tbody>
				<tr style = "cursor:pointer;" onclick="location.href='boderView.jsp?boderId=<%= boderDTO.getBoderId() %>'">
					<td><%= boderDTO.getBoderId() %></td>
					<td><%= boderDTO.getBodertitle() %></td>
					<td><%= boderDTO.getUserId() %></td>
					<td><%= boderDTO.getDateTime() %></td>
					<td><%= boderDTO.getLikeCount() %></td>
				</tr>
<% }
%>
			</tbody>
		</table>
<% if(pageNumber <= 0) {
%>
			<a class="page-link disabled">이전</a>
<% } else {	
%>
			<a class="page-link" href="./boder.jsp?&pageNumber=<%= pageNumber - 1%>">이전</a> 
<% }
%>
		
<% if(boderList.size() < 6) {
%>
			<a class="page-link disabled">다음</a>
<% } else {	
%>
			<a class="page-link" href="./boder.jsp?&pageNumber=<%= pageNumber + 1%>">다음</a> 
<% }
%>
		<a href="./boderWrite.jsp"><button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2">Write</button></a>

	</div>

	<jsp:include page="footer.jsp" flush="false" />
	
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width , initial-scale=1" >
<title>제목을넣으면되ㅎㅎ</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

</head>
<body>
<%
	String userid = (String)session.getAttribute("loginStatus");
	if(userid==null||userid.equals("N")){
		response.sendRedirect(request.getContextPath()+"/register/LoginForm/login.html");
	}

%>
	<div class="container">
		<h1>WRITE</h1>
		<form method="get" id="freeFrm" class="form-horizontal">
			<div class="form-group row">
				<label class="col-sm-2">ID</label>
				<label class="col-sm-10">gg</label>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">Title</label>
				<label class="col-sm-10">gg</label>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">글내용</label>
				<p class="col-sm-10">gg</p>
			</div>	
		</form>
	</div>
	
	<div>
		<div>
			<a href="<%=request.getContextPath()%>/index.jsp">홈</a>
			<a href="<%=request.getContextPath()%>/freeboard/list.jsp">리스트</a>
		
		
		</div>
	
	</div>
</body>
</html>
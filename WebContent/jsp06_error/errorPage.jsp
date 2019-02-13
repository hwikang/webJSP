<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!-- error페이지라는 지시하기 -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	img{
	width:400px;}
</style>
</head>
<body>
<h1>Error on this page please reconnect</h1>
<h3>error is <%=exception.getMessage() %></h3><!--error페이지에서는 exception사용가능  -->
<img src="<%=request.getContextPath()%>/img/error.jpg"/>  <!-- 콘텍스트(주소)만 구해줌 : /webJSP/-->
</body>
</html>
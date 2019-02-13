<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
String color =request.getParameter("color");
String userid =request.getParameter("userid");
String username =request.getParameter("username");
String tel =request.getParameter("tel");

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	body{
		background-color:<%=color%>;
	}
</style>
<body>
<%= userid +"<br/>"+ username +"<br/>" +tel +"<br/>" %>
</body>
</html>
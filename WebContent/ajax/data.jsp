<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>jsp page</h1>

<% 
	String username = request.getParameter("username");
	String tel = request.getParameter("tel");

%>
	<%= username%> : <%= tel%>
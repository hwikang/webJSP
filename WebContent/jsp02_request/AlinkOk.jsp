<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%

	//서버로 데이터가져오기
	String username = request.getParameter("username");
	String tel =request.getParameter("tel");
	String age = request.getParameter("age");
	
%>

<%= username +":" + tel +":"+age %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session객체</title>
</head>
<body>
세션아이디 : <%=session.getId() %>
<%
	String userid="goguma";
	String username="고구마";
	String userPwd="1234";
	//session변수저장
	session.setAttribute("userid", userid);
	session.setAttribute("username", username);
	session.setAttribute("userpwd", userPwd);
	//session 삭제
	session.invalidate();
%>
<br/><a href="../index.jsp">홈으로이동</a>
</body>
</html>
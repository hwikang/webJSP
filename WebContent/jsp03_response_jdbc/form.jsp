<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>폼</h1>
<form methdo="post" action="formOk.jsp">
	아이디:<input type="text" name="userid" value='<%=session.getAttribute("userid")%>'/><br/> <!-- 자바는 무조건 더블따옴표임 -->
	이름:<input type="text" name="username" value='<%=session.getAttribute("username")%>'/><br/>
	전번:<input type="text" name="tel1"/>-
	<input type="text" name="tel2"/>-
	<input type="text" name="tel3"/><br/>
	<input type="submit" value="submit"/><br/>
</form>
</body>
</html>
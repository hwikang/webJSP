<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<% 
	//폼의값을 서버로 가져오기
	//폼의 데이터를 post전송하면 한글코드 iso-8859로 넘어와서 깨짐(여긴 utf-8)
	request.setCharacterEncoding("UTF-8");
		
	
	String name= request.getParameter("username");
	String pwd =request.getParameter("userpwd");
	String gender =request.getParameter("gender");
	//부를값이 여러개일때
	String hobby[] =request.getParameterValues("hobby");
	String job =request.getParameter("job");
%>
<%
	for(int i=0;i<hobby.length;i++){
		 out.print(hobby[i]+",");
	}
%>

<%= name+pwd+gender+job
%>


<h1>request의 메소드</h1>
<ul>
	<li>접속자 ip : <%=request.getRemoteAddr() %></li>
	<li>인코딩 : <%=request.getCharacterEncoding() %></li>
	<li>콘텐츠타입 : <%=request.getContentType() %></li>
	<li>전송방식 : <%=request.getMethod() %></li>
	<li>프로토콜 : <%=request.getProtocol() %></li>
	<li>URI : <%=request.getRequestURI() %></li><!-- 주소  -->
	<li>서버이름 : <%=request.getServerName() %></li>
	<li>port : <%=request.getServerPort() %></li>
	<li>절대주소realpath : <%=request.getServletContext().getRealPath("/") %></li>
</ul>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>
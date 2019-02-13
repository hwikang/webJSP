<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<% 
	request.setCharacterEncoding("UTF-8");

	String color = request.getParameter("color");
	
%>
<%// red.jsp로 보낼 데이터 jsp사용 %>
<jsp:forward page='<%=color+".jsp" %>'>

<jsp:param value="test01" name="userid"/>
<jsp:param value="휘바" name="username"/>
<jsp:param value="01032032903" name="tel"/>


</jsp:forward>
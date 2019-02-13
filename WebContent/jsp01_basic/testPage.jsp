<!-- 지시부 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Calendar, java.util.Scanner" %>
<%@ page import="java.io.InputStream" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!-- 선언부 : 변수 선언 메소드 선언 -->
<%!
	String name="hong";
	int num = 100;
	//구구단 문자열 리턴
	//웹은 무조건 public
	public String gugudan(int dan){
		String result ="";
		for(int i =2;i<10;i++){
			result += dan + "*" + i + "=" +dan*i+"<br/>";
		};
		return result;
	};
%>	



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#calendar{
		color:red;
		font-size:50pt;
	}
</style>
<body>
<div id="calendar">
<%
	//오늘날짜
	Calendar now = Calendar.getInstance();
	int y = now.get(Calendar.YEAR);
	int m = now.get(Calendar.MONTH)+1;
	int d = now.get(Calendar.DATE);
	out.println(now.get(Calendar.YEAR)+"년"+now.get(Calendar.MONTH)+1+"월");
%>
<hr/>
<%= y %>년<%=m+"월" %><%=d+"일" %>
<hr/>

<%= gugudan(5)%>
</div>
<% 
/* 
스크립트릿 : 실행부  */

	int a= 100;
	int b= 200;
	int sum =a+b;
	out.println(sum);
	out.println("<img src='../img/body1.gif'>");


%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!-- error발생시 error페이지로 가라는 지시 -->
<%@ page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="errorPageTest.jsp">
		수1:<input type="text" name="num1"/><br/>
		수2:<input type="text" name="num2"/><br/>
		<input type="submit" value="result"/>
	</form>
<h2>
	<%
		request.setCharacterEncoding("UTF-8");
		String su1 = request.getParameter("num1");
		String su2 = request.getParameter("num2");
		
		if(su1==null||su2==null){
			%>
				계산 가능한 정보가아닙니다.
			<%
		}else{
			int num1 = Integer.parseInt(su1);
			int num2 = Integer.parseInt(su2);
			out.print(num1+"+"+num2+"="+(num1+num2)+"<br/>");
			out.print(num1+"-"+num2+"="+(num1-num2)+"<br/>");
			out.print(num1+"/"+num2+"="+(num1/num2)+"<br/>");
			out.print(num1+"*"+num2+"="+(num1*num2)+"<br/>");
		}
	%>
</h2>

</body>

</html>
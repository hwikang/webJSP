<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#main{
		height:300px;
	}
</style>
</head>
<body>
	<!-- jspf include: data 호환됨 -->
	<%@ include file="header.jspf"%> 

	<div id="main">
		<p>		<!-- header에 잇던 name age를 부를수있음 -->
			이름 : <%= name %><br/>
			나이 : <%=age %>
		</p>
	</div>
	<%@ include file="footer.jspf" %>
</body>
</html>
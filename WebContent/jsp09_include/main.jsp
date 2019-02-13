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
	<!-- jsp include : data 호환안됨 -->
	<jsp:include page="header.jsp" flush="false"/>
	<div id="main">
		main
	</div>
	<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>
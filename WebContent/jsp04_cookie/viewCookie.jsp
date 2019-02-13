<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>See Cookie</title>
</head>
<body>
<ul>
<%
	//쿠키정보얻어오기 request, 여러개이므로 배열로받아줘야함
	Cookie cookie[] = request.getCookies();

	for(int i =0; i<cookie.length; i++){
		//데이터 부르는함수 = 변수 : getName() 값: getValue()
		%>		
		<li><%=cookie[i].getName() %> : <%=cookie[i].getValue() %>		
		
		<%	
				
	};
%>
</ul>
</body>
</html>
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
	<script>
	//페이지실행되면 쿠키생성됨	//네임=밸류;경로;만료
		document.cookie="food=pizza;path/;expires=2019";
		document.cookie="notice=true";
	</script>
	<%
	//jsp쿠키생성 : 클라이언트컴퓨터에 데이터저장
							//	쿠키변수 , 쿠키값
	Cookie cookie = new Cookie("userid","goguma");
	//쿠키 소멸시기
	cookie.setMaxAge(60*60);//초단위
	//쿠키 기록
	response.addCookie(cookie);
	%>
	
	<a href="viewCookie.jsp">쿠키 정보보기<img src="../img/body2.gif"></a>
	
</body>
</html>
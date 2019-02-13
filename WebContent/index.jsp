<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<script>

	$(function(){
		$.ajax({
			url:"ajax/weatherData.xml",
			dataType:"xml",
			success:function(result){
				if($(result).find("location").length>0){
					$(result).find("location").each(function(){
						let city = $(this).find("city").text();
						let time = $(this).find("tmEf:first").text();
						let wf = $(this).find("wf:first").text();
						let tmn = $(this).find("tmn:first").text();
						let tmx = $(this).find("tmx:first").text();
						let txt = "<li><h1>"+city +time+"</h1><h4>"+wf+"</h4><p>최저기온:"+tmn+"최고기온:"+tmx+"</p></li>";
						 
						//alert(time); 
						$("#weather").append(txt);
					});
				}
			},error:function(){
				$("#weather").html("읽어온 데이터가 ㅇ벗음")
			}
			
		});
	});
</script>

<body>
	<!-- index.jsp는 webJSP의 첫페이지 -->
	<ul>
		<li><a href="jsp03_response_jdbc/form.jsp">폼페이지</a></li>
		<li>세션값 얻어오기 <%=session.getId()%><br /> <%
 	if (session.getAttribute("loginStatus") != null && session.getAttribute("loginStatus").equals("Y")) {
 %>
			아이디 : <%=session.getAttribute("userid")%><br /> 이름 : <%=session.getAttribute("username")%>
			<%
				}
			%>
		</li>
		<li>
			<%
				if (session.getAttribute("loginStatus") == null || session.getAttribute("loginStatus").equals("N")) {
			%>
			<a
			href="<%=request.getContextPath()%>/register/LoginForm/login.html">로그인</a>
			<a href="<%=request.getContextPath()%>/register/registerForm.html">회원가입</a>
			아이디찾기 비밀번호찾기 <%
				} else if (session.getAttribute("loginStatus").equals("Y")) {
			%><a
			href="<%=request.getContextPath()%>/register/LoginForm/logout.jsp">로그아웃</a>
			<a href="<%=request.getContextPath()%>/register/LoginForm/alter.jsp">회원정보수정</a>
			<a href="<%=request.getContextPath()%>/freeboard/list.jsp">게시판</a>

			회원탈퇴 <%
				}
			%>


		</li>
		<li>
		</li>
	</ul>


	<h1>My first JSP</h1>
	<%
		out.println("<h2>write from script</h2>");
	%>
	<ul id="weather"></ul>
</body>
</html>
<%@page import="kr.goott.register.RegisterDAO"%>
<%@page import="kr.goott.register.RegisterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");	
//클라이언트가 입력한내용 ->request ->db에저장
	RegisterVO vo =new RegisterVO();
	vo.setUserid(request.getParameter("userid"));
	vo.setUserpwd(request.getParameter("userpwd"));
	vo.setUsername(request.getParameter("username"));
	vo.setBirthday(request.getParameter("birthday"));
	vo.setTel(request.getParameter("tel"));
	//return type - > array
	//결과 => &hobby=스키&hobby=영화감상&hobby=쇼핑						
	vo.setHobby(request.getParameterValues("hobby"));
	vo.setZipcode(request.getParameter("zipcode"));
	vo.setAddr(request.getParameter("addr"));
	vo.setAddrDetail(request.getParameter("addrDetail"));
	System.out.print(vo.getBirthday());
	System.out.print(vo.getHobbyStr());
	RegisterDAO dao = new RegisterDAO();
	int cnt = dao.insertRecord(vo); //추가 여부
	if(cnt>0){
		%>
		<script>
		alert("회원가입 성공");
		locatin.href="LoginForm/login.html";
		</script>
		<%
	}else{
		%>
		<script>
		alert("회원가입 실패");
		history.go(-1);
		</script>
		<%
	}

%>
<%@page import="kr.goott.register.RegisterDAO"%>
<%@page import="kr.goott.register.RegisterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	//id pwd request, db 에 id,pwd 검사후 session에 데이터 저장
	RegisterDAO dao = new RegisterDAO();
	RegisterVO vo = new RegisterVO();
	vo.setUserid(request.getParameter("userid"));
	vo.setUserpwd(request.getParameter("userpwd"));
	
	dao.loginCheck(vo); //loginStatus 설정
	if(vo.getLoginStatus().equals("Y")){
		session.setAttribute("userid",vo.getUserid());
		session.setAttribute("username",vo.getUsername());
		session.setAttribute("loginStatus",vo.getLoginStatus());
								//프로젝트 path 까지만 가져옴 http://localhost:9090/webJSP/
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}else{
		session.setAttribute("loginStatus",vo.getLoginStatus());
		%>
		<script>
			alert("login error");
			history.back();
		</script>
		<%
	}
	
%>
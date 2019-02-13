<%@page import="kr.goott.register.RegisterDAO"%>
<%@page import="kr.goott.register.RegisterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
	RegisterVO vo = new RegisterVO();	
	RegisterDAO dao = new RegisterDAO();
	
	String userid = request.getParameter("userid");

	vo.setUserid(request.getParameter("userid"));
	vo.setUserpwd(request.getParameter("userpwd"));
	vo.setUsername(request.getParameter("username"));
	vo.setBirthday(request.getParameter("birthday"));
	vo.setTel(request.getParameter("tel"));
	vo.setHobby(request.getParameterValues("hobby"));
	vo.setZipcode(request.getParameter("zipcode"));
	vo.setAddr(request.getParameter("addr"));
	vo.setAddrDetail(request.getParameter("addrDetail"));
	
	int cnt = dao.changeUserInfo(vo);
	if(cnt>0){
		
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}else{
		%>
		<script>
		alert("fail")
		history.back();
		</script>
		<%
	}
%>
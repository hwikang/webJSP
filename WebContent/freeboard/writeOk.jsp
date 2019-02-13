<%@page import="kr.goott.freeboard.FreeboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%request.setCharacterEncoding("UTF-8"); %>
<!--
자바 빈스를 사용할떄 유의할점!!!!
	자바 vo의변수와 폼에있는변수의 이름이 똑같아야한다.
		여기서는 write.jsp 와 freeboradvo 를 비교

 vo객체생성 
 id: 객체명 (내맘)
 class= 클래스명 , 패키지 포함
 scope= 생명주기(application, session,page(페이지끝날때까지),request(한번))
-->
<jsp:useBean id="vo" class="kr.goott.freeboard.FreeboardVO" scope="page"/>  
<jsp:setProperty property="*" name="vo"/>
<!-- property: component ex>title,userid,content..
name: 객체명
name에 모든 property를 적용시켜
 -->

<% //클라이언트 ip 구해서 vo에 적용
	vo.setIp(request.getRemoteAddr());

	FreeboardDAO dao = FreeboardDAO.getInstance();
	
	int cnt = dao.insertRecord(vo);
	if(cnt>0){
		response.sendRedirect(request.getContextPath()+"/freeboard/list.jsp");
	}else{
		%>
		<script>
			alert("write error");
			history.back();
		</script>
		<%
	}
%>
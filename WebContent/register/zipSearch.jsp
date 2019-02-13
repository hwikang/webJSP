<%@page import="kr.goott.register.ZipcodeVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.goott.register.RegisterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width , initial-scale=1" >
<title>제목을넣으면되ㅎㅎ</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script>
	$(function(){
		$("#zip li").click(function(){
			var txt = $(this).text();
			alert(txt)
																		//0부터 5
			opener.document.getElementById("zipcode").value=txt.substring(0,5);
			opener.document.getElementById("addr").value=txt.substring(6);
			window.close();
		});
	});
</script>
</head>
<body>
	
	<h2>우편번호 검색</h2>
	도로명을 입력후 버튼을 클릭하세요<br/>
	예: 학의로 146<br/>
	<form method="get" action="zipSearch.jsp">
	도로명입력<input type="text" name="doro" id="doro" placeholder="학의로 146"/>
	<input type="submit" value="검색"/>
	</form>
	<hr/>
	<ul id="zip">
	<%
		//도로명 request 
		request.setCharacterEncoding("UTF-8");
		String doro =request.getParameter("doro");
		RegisterDAO dao = new RegisterDAO();
		List<ZipcodeVO> list = dao.getZipcodeList(doro);
		if(doro==null||doro.equals("")||list.size()<=0){//도로명이없을떄
			%>
					<li>도로명을 입력후 검색하세요 </li>					
			<%
		}else{ //입력된경우
			for(int i=0;i<list.size();i++){
				ZipcodeVO vo = list.get(i);
				%>
					<!-- 우편번호 , 시도 -->
					<li><%=vo.getZipcode() %><%=" "+vo.getSido() %><%if(vo.getSigungu()!=null)out.print(" "+vo.getSigungu());if(vo.getUm()!=null)out.print(" "+vo.getUm());%><%=" "+vo.getDoro() %><%=" "+vo.getbNum() %><%if(vo.getbName()!=null)out.print(" "+vo.getbName()); %>(<%if(vo.getDong()!=null)out.print(" "+vo.getDong()); %><%if(vo.getLiName()!=null)out.print(" "+vo.getLiName()); %>)</li>	
				<%
			}
		}
	%>

</ul>
</body>
</html>
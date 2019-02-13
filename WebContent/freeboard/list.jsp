<%@page import="kr.goott.freeboard.FreeboardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.goott.register.RegisterDAO"%>
<%@page import="kr.goott.freeboard.FreeboardDAO"%>
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
<style>
	.wordCut{
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
	
</style>
</head>
<body>
<%


	//paging에 필요한변수
	int onePageRecord =5;	//한페이지에 보여지는 레코드 수
	int totalPage = 0;	//총페이지수
	int totalRecord =0;	//총 레코드수
	int pageNumMax = 5; //총 페이지 수 (보여지는)
	String numStr = request.getParameter("num");
	int num = 1;	//현재페이지
	int lastPageRecord=5; // 마지막페이지 레코드수
	
	
	
	if(numStr != null){	//페이지를 클릭하지 않은 경우는 1이고 클릭했을때 numStr 이 num 에들어감
		num=Integer.parseInt(numStr);
	}
	FreeboardDAO dao = FreeboardDAO.getInstance();	
	
	//현재페이지, 페이지당 게시물수
	
	//검색어 얻어오기
	String searchWord = request.getParameter("searchWord");		//검색어에 실제로 검색한 검색어
	String searchKey = null;									//검색 카테고리 = title,id,content
	if(!(searchWord==null||searchWord.equals(""))){		//검색을 한경우
		searchKey = request.getParameter("searchKey"); //title,content, userid 를 담은 form
														//searchKey=title&searchWord=sdasd
	}
	//총페이지수 구하기
	totalRecord = dao.allRecordCount(searchKey,searchWord);	//검색한 결과중에서 모든 레코드수
	totalPage = (int)Math.ceil(((double)totalRecord/onePageRecord)) ; 
	lastPageRecord = totalRecord % onePageRecord;

	List<FreeboardVO> list = dao.selectRecord(num,onePageRecord,searchKey,searchWord,totalPage,lastPageRecord);
	
%>

<div class="container">
	<h1>게시판 리스트</h1>
	<div class="list-group">
		<div class="list-group-item list-group-item-action">pages <%=num %>/<%=totalPage %></div>
		<div class="list-group-item list-group-item-action">
			<div class="row">
				<div class="col-sm-1">번호</div>
				<div class="col-sm-6">제목</div>
				<div class="col-sm-2">아이디</div>
				<div class="col-sm-1">조회수</div>
				<div class="col-sm-2">등록일</div>
			</div>
		</div>
		<%
		for(int i =0;i<list.size();i++){
			FreeboardVO vo = list.get(i);			
		%>		
		<div class="list-group-item list-group-item-action">
			<div class="row">
				<div class="col-sm-1"><%=vo.getRecordNo() %></div>
				<div class="col-sm-6 wordCut"><a href="view.jsp?recordNo=<%=vo.getRecordNo()%>"><%=vo.getTitle() %></a></div>
				<div class="col-sm-2"><%=vo.getUserid() %></div>
				<div class="col-sm-1"><%=vo.getHit() %></div>
				<div class="col-sm-2"><%=vo.getRegdate() %></div>
			</div>
		</div>
	
	<%} %>
	</div>
	<!-- paging -->
	<ul class="pagination pagination-sm justify-content-center">
		<%if(num==1){ %>
			<li class="page-item disabled"><a href="#" class="page-link">&laquo;</a></li>
		<%}else{%>
			<li class="page-item"><a href="list.jsp?num=<%=num-1 %><%if(searchKey != null)out.print("&searchKey="+searchKey+"&searchWord="+searchWord); %>" class="page-link">&laquo;</a></li>
				
			
		<%} %> 
		
		<!-- 시작페이지 -->
		<%
		
			//시작페이지1,6,11,,,
			int startPage  = 1;
			//5의 배수와 아닐때 따로 계산
			//현재 % 보여줄 총 페이지수
			if(num % pageNumMax ==0){ //5의 배수
				startPage = ((num-1)/pageNumMax)*5+1; 
			}else{
				startPage = (num/pageNumMax)*5+1;  //1~5인경우 : 1 6~10인경우 6가나옴
			}
			
			for(int i =startPage; i<startPage+pageNumMax;i++){%>
				<% if(i<=totalPage){%>
					<li class="page-item <%if(num==i){out.print("active");}%>"><a href="list.jsp?num=<%=i%><%if(searchKey != null)out.print("&searchKey="+searchKey+"&searchWord="+searchWord); %>" class="page-link"><%=i %></a></li>
				<%} %>
			<%}
		%>
		<%if(num>=totalPage){%>
			<li class="page-item disabled"><a href="#" class="page-link">&raquo;</a></li>
		<%}else{ %>
			<li class="page-item"><a href="list.jsp?num=<%=num+1 %><%if(searchKey != null)out.print("&searchKey="+searchKey+"&searchWord="+searchWord); %>" class="page-link">&raquo;</a></li>
		<%} %>
	</ul>
	
	<!-- 검색어 -->
	<form class="form-inline justify-content-center" id="searchFrm" action="list.jsp">
		<div class="list-group-item searchForm">
			<select name="searchKey" class="form-control">
				<option value="title">제목</option>
				<option value="content">글내용</option>
				<option value="userid">아이디</option>
			</select>
			<input type="text" name="searchWord" class="form-control"/>
			<input type="submit" value="Search" class="form-control"/>			
		</div>
	</form>
	<div class="list-group">
		<div class="list-group-item">
			<a href="<%=request.getContextPath() %>/index.jsp">홈</a>
			<a href="<%=request.getContextPath() %>/freeboard/list.jsp">리스트</a>
			<%if(session.getAttribute("loginStatus").equals("Y")){ %>
				<a href="<%=request.getContextPath() %>/freeboard/write.jsp">글쓰기</a>
			<%}else{ %>
				<a href="#">글쓰기</a>
			<%} %>
		</div>
	</div>
	
</div>
</body>
</html>
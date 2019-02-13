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
	#result{
		background-color:#ddf;
	}
</style>
</head>
<body>
<button onclick="ajaxStart()">ajax 실행 with js</button>
<button onclick="ajaxStart2()">ajax 실행2 with js(동기식)</button>
<div id="result">
</div>
<img src="<%=request.getContextPath() %>/img/body2.gif"/>
<script>
	function ajaxStart(){
		//XMLHttpRequest 객체가 비동기식 동기식을 서버에 데이터요청하는객체
		// 페이지 전체를 리프레쉬 하지 않고서도 수행 되는 "비동기성" , 전체 페이지가 아닌 일부분만을 업데이트
		//비동기식
		//1.객체생성
		var xHttp = new XMLHttpRequest();		
		//2.속성변경될때 호출할함수
		xHttp.onreadystatechange = function(){
			/* 
				readyState: 요청 처리 결과, 0-실패 1-연결 2-요청접수 3-처리요청 4-요청완료
				status : 요청처리상태반환, 200-정상, 403-금지,404-못찾음
				statusTxt : OK , Not Found
				responseText: 실행결과값 반환
				
			*/		
			if(this.readyState==4 &&this.status==200){
				document.getElementById("result").innerHTML = this.responseText;
			}	
			
		}
		//3.요청 정보에대한지정
		// 전송방식(get,post) , 요청할파일명, 비동기식=true,동기식=false)
		xHttp.open("get","data.txt",true);
		//서버에 요청을 보냄
		xHttp.send();		
	}
	//동기식 ajax실행
	function ajaxStart2(){
		var xHttp = new XMLHttpRequest();
		//동기식은 서버에서 응답올때까지 기다림
		xHttp.open("get","data.txt",false);
		xHttp.send();
		document.getElementById("result").innerHTML = xHttp.responseText;
	}
</script>
</body>
</html>
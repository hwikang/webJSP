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
		$("#btn1").click(function(){
			//data : 서버로 데이터 전송시
			//type: request의 타입 (post,get)
			//data type: script json jsp html xml
			//param: parameter 서버로 데이터 보낼때
			
			$.ajax({
				url : "data1.txt", //파일명
				async : true,//true=비동기 false=동기
				success : function(result){
					$("#div1").html(result);
				}
					
				,
				error : function(request,status,error){//200이 아니면 다 에러
					$("#div1").html("message:"+request.responseText+"code:"+request.status+","+error)
				}
			});
		});
			
		
	});										
</script>
</head>
<body>
<div id="div1">
	<h1>ajax()함수를 이용한 배비동기식호출</h1>
	<button id="btn1">클릭</button>
</div>
</body>
</html>
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
		//비동기식 가져오기(리프레쉬안하고 데이터가져오기)
		$("#btn1").click(function(){
						//파일명 불러옴
			$("#div1").load("data.txt");
		});
		$("#btn2").click(function(){
							//읽을데이터,         읽은 값, 성공여부(success),성공여부(200-성공))
			$("#div2").load("data.txt",function(responseTxt,statusTxt,errorNum){
				alert(statusTxt+","+errorNum.status)	//success , 200
				if(errorNum==200){
					$("#div2").html(responseTxt+"aaa");
				}
				if(statusTxt=="error"){
					$("#div2").html("읽어온 내용없음");
				}
				
			});
		})
	});
</script>
</head>
<body>
<button id="btn1">ajax실행(load1)</button>
<button id="btn2">ajax실행(load2)</button>
<div id="div1" style="background-color:lightblue"></div>
<div id="div2" style="background-color:#ddd"></div>
</body>
</html>
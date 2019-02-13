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
	function jspLoad(){
		var http = new XMLHttpRequest();
		http.onreadystatechange = function(){
			if(this.readyState==4 &this.status==200){
				document.getElementById("result").innerHTML = this.responseText;
				/* alert(this.responseText) */
			}
		}
		http.open("GET","data.jsp",true);
		/* http.open("GET","data.jsp?username=홍길동&tel=010-3232-2121",true); */
		http.send();		
	};

</script>
</head>
<body>
<button onclick="jspLoad()">ajax 실행</button>
<button onclick="jspLoad2()">ajax 실행2</button>
<div id="result">
실행결과출력되는곳
</div>
</body>
</html>
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
		$.ajax({
			url :"rssData.xml",
			dataType:"xml",
			success:function(result){
					//item 태그를 찾음
				if($(result).find("item").length>0){
					$(result).find("item").each(function(){
						let title = $(this).find("title").text();
						let link = $(this).find("link").text();
						let des = $(this).find("description").text();
						let date = $(this).find("pubDate").text();
						let date2 = new Date(date);
						let dateStr = date2.getFullYear()+"년"+(date2.getMonth()+1)+"월"+date2.getDate()+"일";
						
						
						let txt = "<li><a href='"+link+"'>"+title+"</a>"+dateStr
						txt +="<p>"+des+"</p></li>";
						
						$("#newsList").append(txt);
					});
				}
			},
			error:function(){
				$("#newsList").html("읽어온 데이터가 없습니다");
			}
		});
	});
</script>
</head>
<body>
	<button id="btn">ajax로 조선일보 인기뉴스보기</button>
	<ul id="newsList">
		
	</ul>
</body>
</html>
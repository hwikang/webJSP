<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.Calendar" %>
<%! 
			public String getDan(int num){
				String result ="";				
				for(int i=2;i<10;i++){
					result += num +"*" + i + "=" +(num*i) + "<br/>";
				};
				return result;				
			};
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- onclick="getDan("+dan+")" -->
<body>
	<div>
		<form>
			<input type="text" name="dan"/>
			<% 			 
			%>
			<input type="submit" value="submit" />

		</form>
			<div>
				<% 
				String dan  = request.getParameter("dan"); 
				int num =0;
				if(dan!=null){						
					num = Integer.parseInt(dan);
					out.print(getDan(num));					
				}
				%>
				
				
			</div>			
			<hr/>
			
			<%="<img src='../img/body1.gif'>" %>
			<%!
			Calendar now = Calendar.getInstance();
			int y = now.get(Calendar.YEAR);
			int m = now.get(Calendar.MONTH)+1;
			int lastDay = now.getActualMaximum(Calendar.DATE);	//31 or 30 ...
			int firstDay = now.get(Calendar.DAY_OF_WEEK);  //화요일이면 3
			int today = now.get(Calendar.DATE);
			//총날짜 = lastDay + firstday-1
			//firstDay 1,2 공백 이니 1,2일때 빈칸찍기
			//3부터 1이찍혀야하니 2를뺴야함(firstDay-1)
			public String createCalendar(){
				String cal = "";
				for(int i=1; i<=lastDay+firstDay-1; i++){
					if(i%7==1){
						cal+="<tr>"	;	
					};
					if(i<firstDay){
						cal+="<td></td>";
					}else if((i-(firstDay-1))==today){
						cal += "<td style='background-color:red'>"+(i-(firstDay-1))+"</td>";
					}else{
					
					cal += "<td>"+(i-(firstDay-1))+"</td>";
					};
					if(i%7==0){
						cal+="</tr>";
					};
				};
				return cal;
			};
			%>
			<%= "<br/>"+ y+"년"+m+"월"+today+"일" %>
			<table>
				<tr>
					<td>일</td>
					<td>월</td>
					<td>화</td>
					<td>수</td>
					<td>목</td>
					<td>금</td>
					<td>토</td>
				</tr>
				<%= createCalendar() %>
			</table>
	</div>
	
		
		
</body>
</html>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%


	//서버로 데이터 가져오기
	request.setCharacterEncoding("UTF-8");
	//db의필드 이름과 html의 이름과 vo 의 이름을 같이할것
	
	String userid= request.getParameter("userid");
	String username = request.getParameter("username");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int cnt = 0;
	
	//db에 추가
try{
	//1. 드라이브 로딩
		String driver = "oracle.jdbc.driver.OracleDriver";	//OracleDriver.class 의 경로임
		Class.forName(driver); //oracledriver를 로드함, -> oracledriver가 객체화되고 drivermanager에서 관리하는 드라이버 리스트에 등록이됨.
	
	//2. db연결 - java.sql에있음 (임포트필요)
	String url = "jdbc:oracle:thin:@172.16.1.13:1521:orcl"; //db정보
	
	conn = DriverManager.getConnection(url,"scott","tiger");//매개변수로 url, 사용자이름,암호 필요함
		//conn 은 db와 app간의 연결을 유지하는역할을함
		//close될때 까지 지속됨
	
	//3. 쿼리문생성statement
	String sql="insert into test values(testsq.nextval,?,?,?,sysdate)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,userid);
	pstmt.setString(2,username);
	pstmt.setString(3,tel1+"-"+tel2+"-"+tel3);
	
	//4. 실행
	cnt = pstmt.executeUpdate();
}catch(Exception e){
	System.out.println("error");
}finally{
	//5.db닫기
	if(pstmt!=null)pstmt.close(); 
	if(conn!=null)conn.close();
}
	//6.페이지이동
	
	//자바로이동
/* 	if(cnt>0){//update 성공
		response.sendRedirect("../index.jsp");
	}else{//실패	
		response.sendRedirect("form.jsp");
	} */

	//자바스크립트로 이동
	if(cnt>0){
		%><!-- HTML -->
		<script>
			alert("완료");
			location.href="../index.jsp";
		</script>
		<%
	}else{
		%>
		<script>
			alert("실패");
			history.go(-1); //history back , back버튼 누른거랑같음
		</script>
		<%
	}
	
	

%>
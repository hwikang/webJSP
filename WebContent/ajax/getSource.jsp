<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<body>
<%
	out.println("jsp파일 에서 ajax처리<br/>");
	
%>
html에서 보낸내용
<table border="1" width="80%">
	<caption>화원목록</caption>
	<tr>
	<th>아이디</th><th>이름</th><th>연락처</th>
	</tr>
	<%
	//1. 드라이브 로딩
			String driver = "oracle.jdbc.driver.OracleDriver";	//OracleDriver.class 의 경로임
			Class.forName(driver); //oracledriver를 로드함, -> oracledriver가 객체화되고 drivermanager에서 관리하는 드라이버 리스트에 등록이됨.
		
		//2. db연결 - java.sql에있음 (임포트필요)
		String url = "jdbc:oracle:thin:@172.16.1.13:1521:orcl"; //db정보
		Connection conn = DriverManager.getConnection(url,"scott","tiger");
		String sql = "select userid, username, tel from register order by username asc";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
			</tr>
			
			<%
		}
	%>
</table>
</body>
</html>
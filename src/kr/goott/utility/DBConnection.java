package kr.goott.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//상속받아 DB연결 -> DAO
public class DBConnection {
	
	//JDBC 드라이브 JVM 등록
	//호출하지 않아도 실행됨. 생성자 메소드보다 먼저 실행됨.
	static {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e) {
			System.out.println("드라이브 로딩 실패...");
		}
	}
	/////////////////////////////////////////////////////
	//protected : 같은 팩키지에서는 접근가능, 다른 팩키지에서는 상속받아 사용.
	protected Connection conn = null;
	protected PreparedStatement pstmt = null;
	protected ResultSet rs = null;
	////////////////////////////////////////////////////
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "SCOTT";
	String password = "tiger";
	
	public DBConnection() {
	}
	//DB연결
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, user, password);
		}catch(Exception e){
			System.out.println("DB연결 ERROR");
		}
	}
	//DB종료
	public void getDBClose() {
		try {
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}catch(Exception e) {
			System.out.println("DB닫기 ERROR");
		}
	}
}

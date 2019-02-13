package kr.goott.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//��ӹ޾� DB���� -> DAO
public class DBConnection {
	
	//JDBC ����̺� JVM ���
	//ȣ������ �ʾƵ� �����. ������ �޼ҵ庸�� ���� �����.
	static {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e) {
			System.out.println("����̺� �ε� ����...");
		}
	}
	/////////////////////////////////////////////////////
	//protected : ���� ��Ű�������� ���ٰ���, �ٸ� ��Ű�������� ��ӹ޾� ���.
	protected Connection conn = null;
	protected PreparedStatement pstmt = null;
	protected ResultSet rs = null;
	////////////////////////////////////////////////////
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "SCOTT";
	String password = "tiger";
	
	public DBConnection() {
	}
	//DB����
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, user, password);
		}catch(Exception e){
			System.out.println("DB���� ERROR");
		}
	}
	//DB����
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
			System.out.println("DB�ݱ� ERROR");
		}
	}
}

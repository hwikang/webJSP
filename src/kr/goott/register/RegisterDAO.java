package kr.goott.register;

import java.util.ArrayList;
import java.util.List;

import kr.goott.utility.DBConnection;

public class RegisterDAO extends DBConnection{

	public RegisterDAO() {	
		
	}
	//기능 구현할때 메소드 추가하면서 작성.

	public int getUserid(String userid) {
		int cnt=0;
		try {
			String sql = "select count(userid) from register where userid=?";
			getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			};
		} catch (Exception e) {
			System.out.println("아이디검색중 에러발생"+e.getMessage());
		}finally {
			getDBClose();
		}
		
		return cnt;
	}

	
	public List<ZipcodeVO> getZipcodeList(String doro) {
		List<ZipcodeVO> list = new ArrayList<ZipcodeVO>();
		try {
			String sql ="select * from zipcodeTbl where doro=?";
			getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, doro);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ZipcodeVO vo = new ZipcodeVO();
				vo.setZipcode(rs.getString(1));
				vo.setSido(rs.getString(2));
				vo.setSigungu(rs.getString(3));
				vo.setUm(rs.getString(4));
				vo.setDoro(rs.getString(5));
				vo.setbNum(rs.getInt(6));			
				vo.setbName(rs.getString(7));				
				vo.setDong(rs.getString(8));				
				vo.setLiName(rs.getString(9));				
				vo.setNum1(rs.getInt(10));
				vo.setNum2(rs.getInt(11));
				list.add(vo);
								
			}
			
		} catch (Exception e) {
			System.out.println("error 발생");
			e.printStackTrace();
		}finally {
			getDBClose();
		}
		
		return list;
	}
	
	public int insertRecord(RegisterVO vo) {
		int cnt =0;		
		
		try {
			getConnection();
																		//문자를 date로 바꿈
			String sql = "insert into register values(regSq.nextVal,?,?,?,to_date(?,'YYYY-MM-DD'),?,?,?,?,?,sysdate)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getUserpwd());
			pstmt.setString(3, vo.getUsername());
			pstmt.setString(4, vo.getBirthday());
			pstmt.setString(5, vo.getTel());
			pstmt.setString(6, vo.getHobbyStr());
			pstmt.setString(7, vo.getZipcode());
			pstmt.setString(8, vo.getAddr());
			pstmt.setString(9, vo.getAddrDetail());
			
			cnt = pstmt.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원가입 에러");
		}finally {
			getDBClose();
		}
		return cnt;
	}
	
	public void loginCheck(RegisterVO vo) {
		try {
			getConnection();
			String sql ="select username from register where userid=? and userpwd=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getUserpwd());
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
					
				vo.setLoginStatus("Y");
				vo.setUsername(rs.getString(1));
			}else {
				vo.setLoginStatus("N");
			}
		}catch(Exception e) {
			System.out.println("login error");
			e.getMessage();
		}finally {
			getDBClose();
		}
	}
	
	public RegisterVO getUserInfo(String userid){
		RegisterVO vo = new RegisterVO();
		try {
			getConnection();
			
			String sql ="select * from register where userid=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setUserid(rs.getString(2));
				vo.setUserpwd(rs.getString(3));
				vo.setUsername(rs.getString(4));
				vo.setBirthday(rs.getString(5));
				vo.setTel(rs.getString(6));
				vo.setHobbyStr(rs.getString(7));
				
				
				vo.setZipcode(rs.getString(8));
				vo.setAddr(rs.getString(9));
				vo.setAddrDetail(rs.getString(10));
			}
				
		} catch (Exception e) {
			System.out.println("get info error");
		}finally {
			getDBClose();
		}
		return vo;	
	}
	
	public int changeUserInfo(RegisterVO vo) {
		int cnt =0;
		try {
			getConnection();
			String sql = "update register set userpwd=? ,username=? ,birthday=? ,tel=? ,hobby=? ,zipcode=? ,addr=? ,adddetail=? where userid=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1,vo.getUserpwd());
			pstmt.setString(2,vo.getUsername());
			pstmt.setString(3,vo.getBirthday());
			pstmt.setString(4,vo.getTel());
			pstmt.setString(5,vo.getHobbyStr());
			pstmt.setString(6,vo.getZipcode());
			pstmt.setString(7,vo.getAddr());
			pstmt.setString(8,vo.getAddrDetail());
			pstmt.setString(9,vo.getUserid());
			System.out.println(vo.getHobbyStr());
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("change error");
			e.printStackTrace();
		}finally {
			getDBClose();
		}
		return cnt;
	}
	
	
	public static void main(String[] args) {
		
	}
}

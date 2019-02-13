package kr.goott.freeboard;

import java.util.ArrayList;
import java.util.List;

import kr.goott.utility.DBConnection;

public class FreeboardDAO extends DBConnection {
	protected FreeboardDAO() {}		//new로 객체 생성못하게
	public static FreeboardDAO getInstance() { //STATIC -> CLASS명.getInstance()
		return new FreeboardDAO();
	}
	
	public int insertRecord(FreeboardVO vo) {
		int cnt =0;
		try {
			getConnection();
			
			String sql ="insert into freeboard values(boardSq.nextVal,?,?,?,0,?,sysdate)";
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getIp());
			
			cnt = pstmt.executeUpdate();
		
		} catch (Exception e) {
			System.out.println("insert error");
			e.printStackTrace();
		}finally {
			getDBClose();
		}
		return cnt;
	}
	
	public int allRecordCount(String searchKey,String searchWord) {
		int cnt=0;
		try {
			getConnection();
			String sql  = "select count(title) from freeboard";
			if(searchKey!=null) {
				sql +=" where "+searchKey + " like '%"+searchWord+"%'";
			}
						
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);				
			}
		} catch (Exception e) {
			System.out.println("count record error");
			e.getMessage();
		}finally {
			getDBClose();
		}
		return cnt;
	}
	
	public List<FreeboardVO> selectRecord(int num, int onePageRecord,String searchKey,String searchWord, int totalPage, int lastPageRecord){
		List<FreeboardVO> list = new ArrayList<FreeboardVO>();
		try {
			getConnection();
			String sql="select * from "
					+ "(select * from "
					+ "(select recordNo,userid,title,hit,regdate from freeboard ";
					if(searchKey != null) {
						sql+=" where "+ searchKey+" like ? ";  //데이터속에있는 검색어
					}					
					sql+= " order by recordNo desc) "
					+ " where rownum<=? order by recordNo asc)"
					+ "where rownum<=? order by recordNo desc";
			
			pstmt = conn.prepareStatement(sql);
			//검색어가 있으면 searchkey ->rownum1->rownum2
			//업으면 rownum1->rownum2
			if(searchKey==null) {
				pstmt.setInt(1,num*onePageRecord);
				if(num==totalPage) {
					pstmt.setInt(2,lastPageRecord);
				}else {
					pstmt.setInt(2,onePageRecord);
				}
			}else {
				pstmt.setString(1, "%"+searchWord+"%");	//사용자가 검색한 검색어
				pstmt.setInt(2,num*onePageRecord);
				if(num==totalPage) {
					pstmt.setInt(3,lastPageRecord);
				}else {
					pstmt.setInt(3,onePageRecord);
				}
				
			}
			rs= pstmt.executeQuery();
			while(rs.next()) {
				FreeboardVO vo  = new FreeboardVO();
				vo.setRecordNo(rs.getInt(1));
				vo.setUserid(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setHit(rs.getInt(4));
				vo.setRegdate(rs.getString(5));
				
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("select record error");
			e.getMessage();
		}finally {
			getDBClose();
		}
		return list;
	}
}

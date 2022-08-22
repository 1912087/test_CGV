package com.mycgv2.dao;

import java.util.ArrayList;
import java.util.List;

import com.mycgv2.vo.CgvBoardVO;

public class CgvBoardDAO extends DBConn{
	//delete() : 게시글 삭제
	public int delete(String bid) {
		int result = 0;
		String sql = "DELETE FROM CGV_BOARD2 WHERE BID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, bid);
			result = pstmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//delete()
	
	//update() : 게시글 업데이트
	public int update(CgvBoardVO vo) {
		int result = 0;
		String sql = "UPDATE CGV_BOARD2 SET BTITLE = ?, BCONTENT = ? WHERE BID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getBtitle());
			pstmt.setString(2, vo.getBcontent());
			pstmt.setString(3, vo.getBid());
			result = pstmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//update()
	
	//updateBhits : 게시글 조회 수 업데이트
	public int updateBhits(String bid) {
		int result = 0;
		String sql = "UPDATE CGV_BOARD2 SET BHITS = BHITS + 1 WHERE BID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, bid);
			result = pstmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//updateBhits()
	
	//select(id) : 게시글 상세 조회
	public CgvBoardVO select(String bid) {
		CgvBoardVO vo = new CgvBoardVO();
		String sql = "SELECT BID, BTITLE, BCONTENT, BHITS, BDATE FROM CGV_BOARD2 WHERE BID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, bid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setBid(rs.getString(1));
				vo.setBtitle(rs.getString(2));
				vo.setBcontent(rs.getString(3));
				vo.setBhits(rs.getInt(4));
				vo.setBdate(rs.getString(5));
			}
			//close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}//select(id)
	
	//insert : 게시글 등록
	public int insert(CgvBoardVO vo) {
		int result = 0;
		String sql = "INSERT INTO CGV_BOARD2 VALUES('b_'||SEQU_CGV_BOARD2.NEXTVAL, ?, ?, '', '', 0, SYSDATE)";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getBtitle());
			pstmt.setString(2, vo.getBcontent());
			
			result = pstmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//insert()
	
	//totalCount : 전체 게시글 로우 수 조회
	public int totalCount() {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM CGV_BOARD2";
		try {
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//totalCount()
	
	//select() : 전체 게시글 조회
	public List<CgvBoardVO> select(int startCount, int endCount){
		List<CgvBoardVO> list = new ArrayList<CgvBoardVO>();
		String sql = "SELECT RNO, BID, BTITLE, BHITS, BDATE "
				+ " FROM (SELECT ROWNUM RNO, BID, BTITLE, BHITS, TO_CHAR(BDATE, 'YYYY-MM-DD') BDATE "
				+ " FROM (SELECT BID, BTITLE, BHITS, BDATE FROM CGV_BOARD2 ORDER BY BDATE DESC)) "
				+ " WHERE RNO BETWEEN ? AND ?";
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, startCount);
			pstmt.setInt(2, endCount);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CgvBoardVO vo = new CgvBoardVO();
				vo.setRno(rs.getInt(1));
				vo.setBid(rs.getString(2));
				vo.setBtitle(rs.getString(3));
				vo.setBhits(rs.getInt(4));
				vo.setBdate(rs.getString(5));
				
				list.add(vo);
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}

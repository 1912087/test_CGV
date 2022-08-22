package com.mycgv2.dao;

import java.util.ArrayList;
import java.util.List;

import com.mycgv2.vo.CgvMemberVO;

public class CgvMemberDAO extends DBConn{
	//select(id) : 멤버 상세 조회
	public CgvMemberVO select(String id) {
		CgvMemberVO vo = new CgvMemberVO();
		String sql = "SELECT ID, NAME, ZONECODE, ADDR1, ADDR2, PNUMBER, HOBBYLIST, INTRO, TO_CHAR(MDATE, 'YYYY-MM-dd') MDATE "
				+ " FROM CGV_MEMBER2 WHERE ID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setId(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setZonecode(rs.getString(3));
				vo.setAddr1(rs.getString(4));
				vo.setAddr2(rs.getString(5));
				vo.setPnumber(rs.getString(6));
				vo.setHobbylist(rs.getString(7));
				vo.setIntro(rs.getString(8));
				vo.setMdate(rs.getString(9));
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}//select(id)
	
	//totalCount : 전체 멤버 수 조회
	public int totalCount() {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM CGV_MEMBER2";
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
	}//totalCount
	
	//select : 멤버 목록 조회
	public List<CgvMemberVO> select(int startCount, int endCount){
		List<CgvMemberVO> list= new ArrayList<CgvMemberVO>();
		String sql = "SELECT RNO, ID, NAME, PNUMBER, MDATE "
				+ " FROM (SELECT ROWNUM RNO, ID, NAME, PNUMBER, TO_CHAR(MDATE, 'YYYY-DD-MM') MDATE "
				+ " FROM (SELECT ID, NAME, PNUMBER, MDATE FROM CGV_MEMBER2 ORDER BY MDATE DESC)) "
				+ " WHERE RNO BETWEEN ? AND ?";
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, startCount);
			pstmt.setInt(2, endCount);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CgvMemberVO vo = new CgvMemberVO();
				vo.setRno(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setPnumber(rs.getString(4));
				vo.setMdate(rs.getString(5));
				
				list.add(vo);
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}//select()
	
	//idCheck : id 중복 체크
	public int idCheck(String id) {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM CGV_MEMBER2 WHERE ID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//idCheck

	//insert : 회원 가입 페이지
	public int insert(CgvMemberVO vo) {
		int result = 0;
		String sql = "INSERT INTO CGV_MEMBER2 VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getZonecode());
			pstmt.setString(7, vo.getAddr1());
			pstmt.setString(8, vo.getAddr2());
			pstmt.setString(9, vo.getHp());
			pstmt.setString(10, vo.getPnumber());
			pstmt.setString(11, vo.getHobbylist());
			pstmt.setString(12, vo.getIntro());
			
			result = pstmt.executeUpdate();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//insert()
	
	//login : 로그인
	public int login(CgvMemberVO vo) {
		int result = 0;
		String sql = "SELECT SUM(CASE WHEN ID = ? THEN (CASE WHEN PASS = ? THEN 2 ELSE 1 END) " + 
									 "ELSE 0 END) LOGIN FROM CGV_MEMBER2";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPass());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//login
}

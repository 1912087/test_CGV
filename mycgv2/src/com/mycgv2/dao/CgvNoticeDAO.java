package com.mycgv2.dao;

import java.util.ArrayList;
import java.util.List;

import com.mycgv2.vo.CgvNoticeVO;

public class CgvNoticeDAO extends DBConn{
	//delete : �Խñ� ����
	public int delete(String nid) {
		int result = 0;
		String sql = "DELETE FROM CGV_NOTICE2 WHERE NID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, nid);
			result = pstmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}//delete()
	
	//update : �Խñ� ����
	public int update(CgvNoticeVO vo) {
		int result = 0;
		String sql = "UPDATE CGV_NOTICE2 SET NTITLE = ?, NCONTENT = ? WHERE NID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getNtitle());
			pstmt.setString(2, vo.getNcontent());
			pstmt.setString(3, vo.getNid());
			result = pstmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//update()
	
	//updateNhits : ��ȸ�� ������Ʈ
	public int updateNhits(String nid) {
		int result = 0;
		String sql = "UPDATE CGV_NOTICE2 SET NHITS = NHITS + 1 WHERE NID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, nid);
			result = pstmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//updateNhits
	
	//select(nid)
	public CgvNoticeVO select(String nid) {
		CgvNoticeVO vo = new CgvNoticeVO();
		String sql = "SELECT NID, NTITLE, NCONTENT, NHITS, NDATE FROM CGV_NOTICE2 WHERE NID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, nid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setNid(rs.getString(1));
				vo.setNtitle(rs.getString(2));
				vo.setNcontent(rs.getString(3));
				vo.setNhits(rs.getInt(4));
				vo.setNdate(rs.getString(5));
			}
			//close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}//select(nid)
	
	//insert : �Խñ� ���
	public int insert(CgvNoticeVO vo) {
		int result = 0;
		String sql = "INSERT INTO CGV_NOTICE2 VALUES('b_'||SEQU_CGV_NOTICE2.NEXTVAL, ?, ?, 0, SYSDATE)";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getNtitle());
			pstmt.setString(2, vo.getNcontent());
			result = pstmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//insert()
	
	//totalCount : ��ü �Խñ� �ο� �� ��ȸ
	public int totalCount() {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM CGV_NOTICE2";
		try {
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}//while
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//totalCount
	
	//��ü �Խñ� ��ȸ
	public List<CgvNoticeVO> select(int startCount, int endCount){
		List<CgvNoticeVO> list = new ArrayList<CgvNoticeVO>();
		String sql = "SELECT RNO, NID, NTITLE, NHITS, NDATE "
				+ "FROM (SELECT ROWNUM RNO, NID, NTITLE, NHITS, TO_CHAR(NDATE, 'YYYY-MM-DD') NDATE "
				+ "FROM (SELECT NID, NTITLE, NHITS, NDATE FROM CGV_NOTICE2 ORDER BY NDATE DESC)) "
				+ "WHERE RNO BETWEEN ? AND ?";
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, startCount);
			pstmt.setInt(2, endCount);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CgvNoticeVO vo = new CgvNoticeVO();
				vo.setRno(rs.getInt(1));
				vo.setNid(rs.getString(2));
				vo.setNtitle(rs.getString(3));
				vo.setNhits(rs.getInt(4));
				vo.setNdate(rs.getString(5));

				list.add(vo);
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}//select()
	
}

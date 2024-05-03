package kr.practice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.practice.vo.PracticeVO;
import kr.util.DBUtil.DBUtil;

public class PracticeDAO {
	private static PracticeDAO instance = new PracticeDAO();
	
	public static PracticeDAO getInstance() {
		return instance;
	}
	
	private PracticeDAO() {}
	
	// 회원가입
	public void insertUser(PracticeVO vo) throws  Exception{
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    String sql = null;
	    try {
	        conn = DBUtil.getConnection();
	        sql = "INSERT INTO  company(num, id, pw, name) VALUES(company_seq.nextval, ?, ?, ? )";
	        
	        pstmt = conn.prepareStatement(sql);
	        
	        pstmt.setString(1, vo.getId());
	        pstmt.setString(2, vo.getPw());
	        pstmt.setString(3, vo.getName());
	        
	        pstmt.executeUpdate();
	        
	    } catch(Exception e) {
	        throw new Exception(e);
	    } finally {
	        DBUtil.executeClose(null, pstmt, conn);
	    }
	    
	}

	
	// 아이디 중복 체크, 로그인 체크
	public PracticeVO checkId(String id)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PracticeVO vo = null;
		String sql = null;
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM company WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new PracticeVO();
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setPw(rs.getString("pw"));
				vo.setNum(rs.getInt("num"));
			}
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return vo;
	}
	
	
	}

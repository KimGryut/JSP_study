package kr.story.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.board.vo.BoardVO;
import kr.story.vo.StoryVO;
import kr.util.DBUtil.DBUtil;

public class StoryDAO {
	private static StoryDAO instance = new StoryDAO();
	
	public static StoryDAO getInstance() {
		return instance;
	}
	
	private StoryDAO() {};
	
	// 글 저장
	public void insert(StoryVO vo) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = DBUtil.getConnection();
			
			sql = "INSERT INTO story (snum, title, content, ip, num) VALUES(story_seq.nextval, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getIp());
			pstmt.setInt(4, vo.getNum());
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	// 글 목록
	public List<StoryVO> getList(int startRow, int endRow) throws Exception{
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<StoryVO> list = null;
	    String sql = null;
	    try {
	        conn = DBUtil.getConnection();
	        // 수정된 SQL 쿼리
	        sql = "SELECT * FROM (SELECT a.*, ROWNUM AS rnum FROM (SELECT * FROM story ORDER BY snum DESC) a WHERE ROWNUM <= ?) WHERE rnum >= ?";
	        pstmt = conn.prepareStatement(sql);
	        // 한 페이지에 표시할 게시글 수를 바인딩합니다.
	        pstmt.setInt(1, endRow);
	        pstmt.setInt(2, startRow);
	        rs = pstmt.executeQuery();
	        list = new ArrayList<StoryVO>();
	        while (rs.next()) {
	            StoryVO vo = new StoryVO();
	            vo.setSnum(rs.getInt("snum"));
	            vo.setTitle(rs.getString("title"));
	            vo.setNum(rs.getInt("num"));
	            vo.setReg_date(rs.getDate("reg_date"));
	            list.add(vo);
	        }
	    } catch (Exception e) {
	        throw new Exception(e);
	    } finally {
	        DBUtil.executeClose(rs, pstmt, conn);
	    }
	    
	    return list;
	}
	
	// 글의 총 개수
	public int getCount() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;
		try {
			conn = DBUtil.getConnection();
							// 컬럼 인덱스 : 1
			sql = "SELECT COUNT(*) cnt FROM story";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
								// 컬럼 인덱스
				count = rs.getInt(1);
				// count(*)처럼 기호가 있으면 안에 쓰지 않고 알리아스를 명시해주는 것도 번거롭기 때문에 인덱스 사용
			}
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;
	}
	
	// 글 상세
	public StoryVO getStory(int num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StoryVO vo = null;
		String sql = null;
		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "SELECT * FROM story WHERE snum=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setInt(1, num);
			//SQL문 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new StoryVO();
				vo.setSnum(rs.getInt("snum"));
				vo.setTitle(rs.getString("title"));
				vo.setNum(rs.getInt("num"));
				vo.setContent(rs.getString("content"));
				vo.setIp(rs.getString("ip"));
				vo.setReg_date(rs.getDate("reg_date"));
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원 정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return vo;
	}
	
	// 글 수정
	public void update(StoryVO vo) throws Exception{
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    String sql = null;
	    try {
	    	// 커넥션풀로부터 커넥션을 할당
	    	conn = DBUtil.getConnection();
	    	// SQL문 작성
	    	sql = "UPDATE story SET title=?, content=?, ip=? WHERE snum=?";
	    	
	    	// PreparedStatement 객체 생성
	    	pstmt = conn.prepareStatement(sql);
	    	
	    	// ? 에 데이터 바인딩
	    	pstmt.setString(1, vo.getTitle());
	    	pstmt.setString(2, vo.getContent());
	    	pstmt.setString(3, vo.getIp());
	    	pstmt.setInt(4, vo.getSnum());
	    	
	    	// SQL문 실행 (빼먹기 쉬움)
	    	pstmt.executeUpdate();
	    } catch(Exception e) {
	    	throw new Exception(e);
	    } finally {
	    	DBUtil.executeClose(null, pstmt, conn);
	    }
	}
	
	// 글 삭제
	public void delete(int num) throws Exception{
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    String sql = null;
	    try {
	    	// 커넥션풀로부터 커넥션을 할당
	    	conn = DBUtil.getConnection();
	    	// SQL문 작성
	    	sql = "DELETE FROM story WHERE snum=?";
	    	
	    	// PreparedStatement 객체 생성
	    	pstmt = conn.prepareStatement(sql);
	    	
	    	// ? 에 데이터 바인딩
	    	pstmt.setInt(1, num);
	    	
	    	// SQL문 실행 (빼먹기 쉬움)
	    	pstmt.executeUpdate();
	    } catch(Exception e) {
	    	throw new Exception(e);
	    } finally {
	    	DBUtil.executeClose(null, pstmt, conn);
	    }
	}
}
	
	

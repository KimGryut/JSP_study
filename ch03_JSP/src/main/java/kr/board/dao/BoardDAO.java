package kr.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.board.vo.BoardVO;
import kr.member.vo.MemberVO;
import kr.util.DBUtil.DBUtil;

public class BoardDAO {
	// 싱글턴 패턴
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	private BoardDAO() {}
	
	// 글 저장
	public void insert(BoardVO boardVO) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			// 커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			
			// SQL문 작성
			sql = "INSERT INTO mboard (num, title, name, passwd, content, ip) VALUES (mboard_seq.nextval, ?, ?, ?, ?, ?)";

			 // PreparedStatement 객체 생성
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, boardVO.getTitle());
	        pstmt.setString(2,  boardVO.getName());
	        pstmt.setString(3, boardVO.getPasswd());
	        pstmt.setString(4, boardVO.getContent());
	        pstmt.setString(5, boardVO.getIp());

	        // 쿼리 실행
	        pstmt.executeUpdate();
		} catch(Exception e) {
			// jsp할 때 예외 던지기
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	// 글의 총 개수 
	public int getCount() throws Exception {
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = null;
	    int count = 0;
	    
	    return count;
	}
	
	// 글 목록 작업
	public List<BoardVO> getList(int startRow, int endRow) throws Exception{
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<BoardVO> list = new ArrayList<>();
	    String sql = null;
	    try {
	    	conn = DBUtil.getConnection();
	    	
	    	sql = "SELECT * FROM mboard ORDER BY num DESC";
	    	
	        pstmt = conn.prepareStatement(sql);
	        
	        rs = pstmt.executeQuery();
	        
	        while(rs.next()) {
	            BoardVO boardVO = new BoardVO();
	            boardVO.setNum(rs.getInt("num"));
	            boardVO.setTitle(rs.getString("title"));
	            boardVO.setName(rs.getString("name"));
	            boardVO.setReg_date(rs.getDate("reg_date"));
	            
	            // 자바빈을 어레이리스트에 저장
	            list.add(boardVO); 
	        }
	    } catch(Exception e) {
	    	throw new Exception(e);
	    } finally {
	    	DBUtil.executeClose(rs, pstmt, conn);
	    }
	    return list;
	}
	
	// 글 상세
	public BoardVO getBoard(int num) throws Exception{
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    BoardVO board = null;
	    String sql = null;
	    
	    try {
	         conn = DBUtil.getConnection();
	         sql = "SELECT * FROM mboard WHERE num=?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, num);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	            board = new BoardVO();
	            board.setNum(rs.getInt("num"));
	            board.setTitle(rs.getString("title"));
	            board.setName(rs.getString("name"));
	            board.setPasswd(rs.getString("passwd"));
	            board.setContent(rs.getString("content"));
	            board.setIp(rs.getString("ip"));
	            board.setReg_date(rs.getDate("reg_date"));
	         }
	     } catch(Exception e) {
	         throw new Exception(e);
	     } finally {
	         // 자원 정리
	         DBUtil.executeClose(rs, pstmt, conn);
	     }
	    
	    return board;
	}

	// 글 수정
	public void updateBoard(BoardVO boardVO) throws Exception{

	}

	// 글 삭제
	public void deleteBoard(int num) throws Exception{

	}
}

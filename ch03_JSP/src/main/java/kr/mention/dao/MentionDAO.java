package kr.mention.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import kr.mention.vo.MentionVO;
import kr.util.DBUtil.DBUtil;

public class MentionDAO {
	private static MentionDAO instance = new MentionDAO();
	public static MentionDAO getInstance() {
		return instance;
	}
	private MentionDAO() {}
	
	// 댓글 쓰기
	public void insertMention(MentionVO vo) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = DBUtil.getConnection();
			
			sql = "INSERT INTO mention (mnum, id, content, snum) VALUES(mention_seq.nextval, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getSnum());
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	// 댓글 보기
	public List<MentionVO> getMetnionList(int startRow, int endRow) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MentionVO> list = null;
		String sql = null;
		
		return list;
	}
	
	// 댓글 수정
	public void updateMention(MentionVO vo) throws Exception{
		
	}
	
	// 댓글 삭제
	public void deleteMention(MentionVO vo) throws Exception{
		
	}
	
}

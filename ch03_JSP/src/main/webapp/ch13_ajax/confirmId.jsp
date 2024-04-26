<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="kr.util.DBUtil.DBUtil"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%
// 전송된 데이터 인코딩 타입 지정
request.setCharacterEncoding("utf-8");

// 전송된 아이디 반환
String id = request.getParameter("id");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = null;

try {
	// Connection 객체 반환
	conn = DBUtil.getConnection();
	// sql 문 작성
	sql = "SELECT id FROM people WHERE id=?";
	//  JDBC 수행 3단계 : PrepareStatement 객체 생성
	pstmt = conn.prepareStatement(sql);
	// ? 에 데이터 바인딩
	pstmt.setString(1, id);
	// JDBC 수행 4단계
	rs = pstmt.executeQuery();
	if(rs.next()){ // id 중복
%>

{"result": "idDuplicated"}

<%
	} else { // id 미중복
		
		// 제이슨 문자열 사용할 때 html 주석 달면 안 됨
		%>
{"result" : "idNotFound"}
<%
		
	}
	
} catch(Exception e) {
	
	%>
{"result" : "failure"}
<%
	
	e.printStackTrace();
} finally {
	// 자원 정리
	DBUtil.executeClose(rs,pstmt,conn);
}
%>


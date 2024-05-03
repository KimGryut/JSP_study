<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.practice.vo.PracticeVO" %>
<%@ page import="kr.practice.dao.PracticeDAO" %>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	PracticeDAO dao = PracticeDAO.getInstance();
	PracticeVO vo = dao.checkId(id);
	
	boolean check = false;
	
	// 입력한 아이디를 가진 사용자가 있는지 확인
	if(vo!=null){
		// 그 아이디의 비밀번호와 입력한 비밀번호가 일치하는지 확인
		check = vo.isCheckedPassword(pw);
		if(check){ // 로그인 성공
			session.setAttribute("user_id", id);
			session.setAttribute("user_num", vo.getNum());
			session.setAttribute("user_name", vo.getName());
			
			response.sendRedirect("main.jsp");
		} else { // 로그인 실패 (비밀번호 오 입력)
%>
	<script>
		alert('잘못된 비밀번호를 입력하셨습니다.');
		history.go(-1);
	</script>

<%
		}
	} else { // 입력한 아이디를 가진 사용자가 없음 (아이디 오 입력)
%>
	<script>
		alert('잘못된 아이디를 입력하셨습니다.');
		history.go(-1);
	</script>
<%	
	}
%>
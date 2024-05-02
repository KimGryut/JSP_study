<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.member.dao.MemberDAO"%>
<%@ page import="kr.member.vo.MemberVO"%>
<%
	//전송된 데이터 인코딩 타입 지정
	request.setCharacterEncoding("utf-8");
	
	//전송된 데이터 반환
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	MemberDAO dao = MemberDAO.getInstance();
	MemberVO member = dao.checkMember(id);
	
	boolean check = false;
	
	if (member != null) { // 아이디 존재
		// 사용자가 입력한 비밀번호와  table에 저장된 비밀번호 일치 여부 확인
		check  = member.isCheckedPassword(passwd);
		if(check){ // 일치
			// 로그인 처리
			// 내부적 작업을 할 때는 프라이머리키인 걸 사용하는 게 좋고, 노출된 것보다 member.getNum()같은 걸 사용하는 게 보안에 좋다
			session.setAttribute("user_num", member.getNum()); 
			session.setAttribute("user_id", id);
			session.setAttribute("user_name", member.getName()); // 사용자 이름을 세션에 저장

			// main.jsp로 리다이렉트
			response.sendRedirect("main.jsp");

		} else{ // 불일치
%>
		<script type="text/javascript">
			alert('비밀번호가 불일치합니다');
			history.go(-1);
		</script>
<%
		}
	} else { // 아이디 존재 x
%>
		<script type="text/javascript">
			alert('존재하지 않는 아이디입니다.');
			history.go(-1);
		</script>
<%		
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO"%>
<%@ page import="kr.employee.vo.EmployeeVO"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	EmployeeDAO dao = EmployeeDAO.getInstance();
	EmployeeVO vo = dao.checkEmployee(id);
	
	boolean check = false;
	
	if(vo != null) { // 입력한 아이디를 가진 사용자가 존재
		// 비밀번호가 일치하는지 확인
		check = vo.isCheckedPassword(passwd);
		if(check) { // 일치 -> 로그인 성공
			session.setAttribute("employee_num", vo.getNum());
			session.setAttribute("employee_id", id);
			session.setAttribute("employee_name", vo.getName());
			
			response.sendRedirect("main.jsp");
		} else{ // 비밀번호 불일치 -> 로그인 실패
%>
			<script>
				alert('비밀번호가 틀렸습니다.');
				history.go(-1);
			</script>
<%
		}
	} else { // 아이디 존재 x -> 로그인 실패
%>
		<script>
				alert('아이디가 틀렸습니다.');
				history.go(-1);
			</script>
<%	
	}
%>
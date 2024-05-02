<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<%
	Integer employee_num = (Integer)session.getAttribute("employee_num");
	if(employee_num == null){ // 로그인 되지 않음
		response.sendRedirect("loginForm.jsp"); // 로그인 페이지로 이동 
	} else { // 로그인 된 경우
		// 전송된 데이터 인코딩 타입 지정
		request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="vo" class="kr.employee.vo.EmployeeVO"/>
<jsp:setProperty property="*" name="vo"/>

<%
	// 세션 넘버를 사용해서 사원 정보 불러옴
	vo.setNum(employee_num);
	
	EmployeeDAO dao = EmployeeDAO.getInstance();
	dao.updateEmployee(vo);
%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>사원 정보 수정 완료</title>
	</head>
	<body>
		<div class="page-main">
			<h1>사원 정보 수정 완료</h1>
			<div class="result-display">
				<div class="align-center">
					사원 정보 수정 성공!
					<p>
						<button onclick="location.href='myPage.jsp'">MyPage</button>
				</div>
			</div>
		</div>
	</body>
</html>
<%


	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<%@ page import="kr.employee.vo.EmployeeVO" %>
<%
	Integer employee_num = (Integer) session.getAttribute("employee_num");
	if(employee_num==null) { // 로그인 안 되어 있음
		response.sendRedirect("loginForm.jsp");
	} else { // 로그인되어 있음
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원상세정보</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" type="text/css">
</head>
<body>
<%
	EmployeeDAO dao = EmployeeDAO.getInstance();
	EmployeeVO vo = dao.getEmployee(employee_num);
%>

	
	<div class="page-main">
		<h1>사원정보</h1>
		<ul>
			<li>아이디: <%=vo.getId() %></li>
			<li>이름: <%=vo.getName() %></li>
			<li>임금: <%=vo.getSalary() %></li>
			<li>업무: <%=vo.getJob() %></li>
			<li>가입일: <%=vo.getReg_date() %></li>
		</ul>
		<hr size="1" width="100%" noshade="noshade">
		<div class="align-right">
			<input type="button" value="사원정보수정" onclick="location.href='modifyEmployeeForm.jsp'">
			<input type="button" value="사원정보삭제" onclick="location.href='deleteEmployeeForm.jsp'">
			<input type="button" value="홈으로" onclick="location.href='main.jsp'">
		</div>
	</div>
</body>
</html>

<%
	}
%>

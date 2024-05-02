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
<title>회원정보수정</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
	
		$('#modify_form').submit(function(){
			const items = document.querySelectorAll('.input-check');
			for(let i=0; i<items.length; i++){
				if(items[i].value.trim()==''){
					const label = document.querySelector('label[for="'+items[i].id+'"]');
					alert(label.textContent + ' 항목은 필수 입력');
					items[i].value = '';
					items[i].focus();
					return false;
				}
				
			}
		});
	});
</script>
</head>
<body>
<%
	EmployeeDAO dao = EmployeeDAO.getInstance();
	EmployeeVO vo = dao.getEmployee(employee_num);
	
%>

	<div class="page-main">
		<h1>회원정보수정</h1>
		<form action="modifyEmployee.jsp" method="post" id="modify_form">
			<ul>
				<li> <!-- 아이디 변경 못함 -->
				    <label for="id">아이디</label>
				    <input type="text" name="id" id="id" class="input-check" size="7" maxlength="12" autocomplete="off" value="<%=vo.getId()%>" readonly>
				</li>

				<li>
					<label for="name">이름</label>
					<input type="text" name="name" id="name" class="input-check" maxlength="10" value="<%=vo.getName()%>">
				</li>
				<li>
					<label for="passwd">비밀번호</label>
					<input type="password" name="passwd" id="passwd" class="input-check" maxlength="12">
				</li>
				<li>
					<label for="salary">임금</label>
					<input type="number" name="salary" id="salary" class="input-check" value="<%=vo.getSalary() %>" maxlength="50">
				</li>
				<li>
					<label for="job">업무</label>
					<input type="text" name="job" id="job" value="<%=vo.getJob() %>" maxlength="15">
				</li>
			</ul>
			<div class = "align-center">
				<input type="submit" value="등록">
				<input type="button" value = "홈으로" onclick="location.href='main.jsp'">
			</div>
		</form>
	</div>
</body>
</html>			
<%
	}
%>

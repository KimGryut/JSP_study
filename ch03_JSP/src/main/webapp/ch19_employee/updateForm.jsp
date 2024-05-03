<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.story.dao.StoryDAO" %>
<%@ page import = "kr.story.vo.StoryVO" %>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<%
	int snum = Integer.parseInt(request.getParameter("snum"));
	StoryDAO dao = StoryDAO.getInstance();
	StoryVO vo = dao.getStory(snum);
	
	String name = "";
	if(vo != null) {
	    EmployeeDAO employeeDAO = EmployeeDAO.getInstance();
	    name = employeeDAO.findEmployeeName(vo.getNum());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" type="text/css">
<script type="text/javascript">
window.onload=function(){
	const myForm = document.getElementById('write_form');
	myForm.onsubmit = function(){
		const items = document.querySelectorAll('input[type="text"], textarea');
		for(let i=0;i<items.length;i++){
			if(items[i].value.trim()==''){
				const label = document.querySelector('label[for="'+items[i].id+'"]');
				alert(label.textContent + ' 항목은 필수 입력');
				items[i].value = '';
				items[i].focus();
				return false;
			}
		}
	}
}
</script>
</head>
<body>
		<div class="page-main">
			<h1>글 쓰기</h1>
			<form id="update_form" action="update.jsp" method="post">
			<input type="hidden" name="snum" value="<%=snum%>">
				<ul>
					<li>
						<label for="title">제목</label>
						<input type="text" name="title" id="title" size="30" maxlength="50" value="<%=vo.getTitle() %>">
					</li>
					<li>
						<label for="content">내용</label>
						<textarea rows="5" cols="40" name="content" id="content" ><%=vo.getContent() %></textarea>
					</li>
				</ul>
				<div class="align-center">
					<input type="submit" value="글 수정">
					<input type="button" value="목록" onclick="location.href='list.jsp'">
					
				</div>
			</form>
		</div>
</body>
</html>
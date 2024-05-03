<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.practice.dao.PracticeDAO" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="vo" class="kr.practice.vo.PracticeVO"/>
<jsp:setProperty name="vo" property="*"/>

<%
	PracticeDAO dao = PracticeDAO.getInstance();
	dao.insertUser(vo);
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
*{
	margin: 0;
	padding: 0;	
}

body{
	background-color: #e0f8ff;
}

.title{
	color: #005d96;
}

.main-page{
	margin: auto;
	margin-top:100px;
	text-align : center;
	width: 400px;
	height: 450px;
}

.in-page{
	background-color: white;
	border-radius : 10px;
	margin-top:20px;
	border : 1px  solid #b3eeff;
	height : 280px;
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
}

.login-page {
	position: absolute;
	bottom: 20px;
}

button{
	border: 0;
    background-color: transparent;
    color: #004c7a;
}
</style>
</head>
<body>
	<div class="main-page">
		<div class="in-page">
			<h1 class="title">회원가입완료!</h1>
			<div class="login-page">
				<button onclick="location.href='loginForm.jsp'"> 로그인 </button>
			</div>
		</div>
		
	</div>
</body>
</html>
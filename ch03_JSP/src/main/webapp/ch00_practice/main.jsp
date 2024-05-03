<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

body{
	background-color:#e0f8ff;
}
.header { /*타이틀*/
	background-color: #004c7a;
	text-align: center;
	padding: 20px;
	color:white;
}

/* 메뉴바 박스 */
.topnav {
	overflow: hidden;
	background-color: #b3eeff;
	display: flex;
	justify-content: center;
}

/* 메뉴바 링크 */
.topnav a {
	float: left;
	display: block;
	color: #005d96;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	justify-content: center;
}

/* 메뉴바에 올렸을 때 */
.topnav a:hover {
	background-color: #54d9ff;
	color: white;
}

/* Create three equal columns that floats next to each other */
.column {
	float: left;
	width: 31%;
	padding: 15px;
	background-color:white;
}

/* Clear floats after the columns */
.row::after {
	content: "";
	display: table;
	clear: both;
}

/* 반응형 */
@media screen and (max-width:600px) {
	.column {
		width: 100%;
	}

	/*바닥*/
	.footer {
		background-color: #f1f1f1;
		padding: 10px;
		text-align: center;
	}
}

span {
	text-align : right;
	 display : block;
	 color:#e0f8ff;
}
</style>
</head>
<body>
<%
	String name = (String) session.getAttribute("user_name");
	
%>

	<!-- 타이틀 -->
	<div class="header">
		<h1>타이틀</h1>
		<%
			if(name!=null) {
		%>
			<span><%=name %>님이 로그인 중</span>		
		<%		
			}
		%>
	</div>

	<!-- 메뉴바 -->
	<div class="topnav">
		<a href="#">마이페이지</a> 
		<a href="#">게시판</a> 
		<a href="#">유튜브 </a>
		<%
			if(name!=null) {
		%>
			<a href="logout.jsp">로그아웃</a>
		<%		
			} else {
		%>
			<a href="loginForm.jsp">로그인</a>
		<%
			}
		%>
		
	</div>

	<!-- 컬럼 -->

	<div class="row">
		<div class="column">
			<h2>Column</h2>
			<p></p>
		</div>

		<div class="column">
			<h2>Column</h2>
			<p></p>
		</div>

		<div class="column">
			<h2>Column</h2>
			<p></p>
		</div>
	</div>


	<!-- 바닥 -->
	<div class="footer">
		<p></p>
	</div>


</body>
</html>
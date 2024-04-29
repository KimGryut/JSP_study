<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 전송된 데이터 인코딩 타입 지정
	request.setCharacterEncoding("utf-8");
%>
<!--  
	useBean의 id와 setProperty의 name은 일치되어야 함
	setProperty로 객체에 접근
 -->
<jsp:useBean id="member" class="kr.web.member.MemberVO"/>
<jsp:setProperty name="member" property="*"/>
<!-- *로 다 넣어버리면 빈에서 설정한 변수명만 맞추면 자동으로 다 됨 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	아이디 : <jsp:getProperty property="id" name="member"/><br>
	비밀번호 : <jsp:getProperty property="password" name="member"/><br>
	이름 : <jsp:getProperty property="name" name="member"/><br>
	이메일 : <jsp:getProperty property="email" name="member"/><br>
	주소 : <jsp:getProperty property="address" name="member"/>
</body>
</html>
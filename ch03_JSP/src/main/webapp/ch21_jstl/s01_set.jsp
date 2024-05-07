<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="kr.web.member.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>set 태그</title>
</head>
<body>
<%--			속성명			속성값				영역 --%>
<c:set var="msg" value="봄" scope="page"/>
<c:set var="msg2" value="여름" scope="request"/>
<c:set var="msg3" value="가을" scope="session"/>
<c:set var="msg4" value="겨울" scope="application"/>

페이지 영역 : ${pageScope.msg}, ${msg}<br>
요청(request) 영역 : ${requestScope.msg2}, ${msg2}<br>
세션(session) 영역 : ${sessionScope.msg3}, ${msg3}<br>
애플리케이션(application) 영역 : ${applicationScope.msg4}, ${msg4}<br><br>

<%
	Member member = new Member();
%>

<%-- 페이지 영역에 Member 객체 저장 --%>
<c:set var="member" value="<%= member %>"/>
<%-- 
Member 객체의 name 멤버 변수에 데이터 저장 
target : 값을 설정하고자 하는 객체를 명시
property : 값이 저장되는 멤버 변수
--%>
<c:set target="${member }" property="name" value="홍길동"/>
회원 이름 : ${member.name}<br>
회원 이름 : ${member.getName()}<br>

</body>
</html>
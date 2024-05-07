<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>title 태그</title>
</head>
<body>
			<!-- 불리언 -->
<c:if test="true">
	무조건 수행 <br>	
</c:if>

<c:if test="${param.name.equals('dragon')}">
	name 파라미터 값이 ${param.name}입니다.
</c:if>
<br>
<c:if test="${param.name == 'dragon'}"> <%-- EL에선 문자열까리 비교할 때, tomcat 7버전 이상부터 비교 연산자 사용 가능 --%>
	name 파라미터 값이 ${param.name}입니다.
</c:if>


<c:if test="${param.age >= 20}">
	name 당신의 나이는 ${param.age } 이상입니다.
</c:if>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 에러가 발생할 때 보여질 에러 페이지 지정 --%>
    <%@ page errorPage="/ch06_errorPage/error/viewErrorMessage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터 출력</title>
</head>
<body>
<%-- 
toUpperCase() 하기 전에는 단순히 null이라고 떴지만 대문자화하는 순간 예외가 발생
=> 굉장히 디테일하게 발생함
=> 다른 사용자가 봤을 시 좋지 않은 부분
=> 사용자 정의 에러 페이지 정의 요함 
 --%>
name 파라미터의 값 : <%=request.getParameter("name").toUpperCase() %>
</body>
</html>
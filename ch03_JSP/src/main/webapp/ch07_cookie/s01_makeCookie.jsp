<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 한글 깨짐 방지 --%>    
<%@ page import = "java.net.URLEncoder" %>

<%-- 쿠키 객체 생성 -> 서블릿에서 가져오기 때문에 import 없이 호출 가능 --%>
<%
	Cookie cookie = new Cookie("name", URLEncoder.encode("홍길동", "UTF-8"));
	// 쿠키 유효시간 지정(단위:초)
	// 쿠키 유효시간을 지정하면 클라이언트 영역의 저장소에 쿠키 정보 보관
	// 쿠키 유효시간을 미지정시 메모리에 쿠키 정보를 보관
	// cookie.setMaxAge(30*60);
	// cookie.setMaxAge(-1); // 메모리에 쿠키 정보를 보관
	
	// 생성한 쿠키를 클라이언트에 전송
	response.addCookie(cookie);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 생성	</title>
</head>
<body>

<%= cookie.getName() %> 쿠키의 값은 <b><%=cookie.getValue() %></b>

</body>
</html>
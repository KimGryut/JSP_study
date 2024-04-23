<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[실습] 회원가입 출력</title>
</head>
<body>
    <%-- POST 방식으로 전송된 데이터의 인코딩 타입을 UTF-8로 지정 --%>
    <% request.setCharacterEncoding("utf-8"); %>
    
    이름: <%= request.getParameter("name") %><br>
    아이디: <%= request.getParameter("id") %><br>
    비밀번호: <%= request.getParameter("password") %><br>
    전화번호: <%= request.getParameter("phone") %><br>
    취미 :
    <% String[] hobbys = request.getParameterValues("hobby"); %>
    <% if(hobbys != null) { %>
        <% for(int i=0; i<hobbys.length; i++) { %>
            <%= hobbys[i] %>
            <% if(i < hobbys.length - 1) { %>
                ,
            <% } %>
        <% } %>
    <% } else { %>
        없음
    <% } %>
    <br>
    자기소개: <%= (request.getParameter("content") != null) ? request.getParameter("content") : "없음" %><br>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 파라미터 출력</title>
</head>
<body>
    <%-- POST 방식으로 전송된 데이터의 인코딩 타입을 UTF-8로 지정 --%>
    <% request.setCharacterEncoding("utf-8"); %>

    <h3>request.getParameter() 메서드 사용</h3>
    <%-- name 파라미터를 받아와서 출력 --%>
    이름: <%= request.getParameter("name") %><br>
    <%-- address 파라미터를 받아와서 출력 --%>
    주소: <%= request.getParameter("address") %><br>
    
    <h3>request.getParameterValues() 메서드 사용</h3>
    <%-- pet 파라미터를 배열로 받아옴 --%>
    <% String[] pets = request.getParameterValues("pet"); %>
    <%-- pet 파라미터가 선택되었다면 각 값을 출력 --%>
        <% if(pets != null) { %>
        <% for(String pet : pets) { %>
            <%= pet %><br>
        <% } %>
    <% } %>
   
</body>
</html>
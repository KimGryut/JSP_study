<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.text.NumberFormat" %>
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
    
    배송 희망일: <%= request.getParameter("order_date") %><br>
    상품 구입 :
    <% String[] items = request.getParameterValues("item"); %>
    <% if(items != null) { %>
        <% for(int i=0; i<items.length; i++) { %>
            <%= items[i] %>
            <% if(i < items.length - 1) { %>
                ,
            <% } %>
        <% } %>
    <% } %>
    <br>
    <%
    int shippingFee = Integer.parseInt(request.getParameter("shippingFee"));
    String formattedShippingFee = NumberFormat.getCurrencyInstance().format(shippingFee);
    %>
    배송비 : <%=formattedShippingFee%>
    <br>
    
    <%
    int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
    String formattedTotalPrice = NumberFormat.getCurrencyInstance().format(totalPrice);
    %>
    총 구매 비용 (배송비 포함) : <%=formattedTotalPrice%>
    <br>
    
</body>
</html>
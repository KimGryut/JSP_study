<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%@ page import="kr.story.vo.StoryVO" %>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<%
    // snum 파라미터 받기
    int snum = 0;
    String snumParam = request.getParameter("snum");
    if(snumParam != null && !snumParam.equals("")) {
        snum = Integer.parseInt(snumParam);
    }
    // snum으로 해당 스토리 정보 가져오기
    StoryDAO dao = StoryDAO.getInstance();
    StoryVO vo = dao.getStory(snum);
    
    // 작성자 이름 가져오기
    String name = "";
    if(vo != null) {
        EmployeeDAO employeeDAO = EmployeeDAO.getInstance();
        name = employeeDAO.findEmployeeName(vo.getNum());
    }
    
    // 세션에서 로그인한 사원의 번호 가져오기
    String employee_id = (String) session.getAttribute("employee_id");
    Integer employee_num = (Integer) session.getAttribute("employee_num");
    // 세션에 값이 없는 경우 기본값 설정
    if (employee_id == null) {
        employee_id = "";
    }
    if (employee_num == null) {
        employee_num = 0;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 상세</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">
</head>
<body>
<div class="page-main">
    <h1>게시판 글 상세</h1>
    <ul>
        <li>글번호 : <%= vo != null ? vo.getSnum() : "" %> </li>
        <li>제목 : <%= vo != null ? vo.getTitle() : "" %> </li>
        <li>작성자 : <%= name %> </li>
    </ul>
    <hr size="1" width="100%" noshade="noshade">
    <p>
        <%= vo != null ? vo.getContent() : "" %>
    </p>
    <div class="align-right">
        작성일 : <%= vo != null ? vo.getReg_date() : "" %>
        
        <% if (employee_num==vo.getNum()) { %>
            <input type="button" value="수정"
              onclick="location.href='updateForm.jsp?snum=<%= vo != null ? vo.getSnum() : "" %>'">
            <input type="button" value="삭제"
              onclick="location.href='deleteForm.jsp?snum=<%= vo != null ? vo.getSnum() : "" %>'">
        <% } %>
        
        <input type="button" value="목록"
            onclick="location.href='list.jsp'">  
    </div>
</div>
</body>
</html>

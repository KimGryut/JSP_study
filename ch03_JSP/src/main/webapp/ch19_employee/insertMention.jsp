<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.mention.dao.MentionDAO" %>
<%
    // 전송된 데이터 인코딩 타입 지정
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="vo" class="kr.mention.vo.MentionVO"/>
<jsp:setProperty property="*" name="vo"/>
<%
	int snum = Integer.parseInt(request.getParameter("snum"));

	String employee_id = (String)session.getAttribute("employee_id");
	vo.setId(employee_id);
	vo.setSnum(snum);
	MentionDAO dao = MentionDAO.getInstance();
	dao.insertMention(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 작성</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" type="text/css">
</head>
<body>
    <div class="page-main">
        <h1>댓글 작성 완료</h1>
        <div class="result-display">
            <div class="align-center">
                댓글 작성 성공!<p>
                <button onclick="history.go(-1)">확인 </button>
            </div>
        </div>
    </div>
</body>
</html>
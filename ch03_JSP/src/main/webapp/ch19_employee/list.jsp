<%@page import="kr.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<%@ page import="kr.story.vo.StoryVO" %>
<%@ page import="java.util.List" %>
<%@ page import="kr.util.DBUtil.PagingUtil" %>
<%
//선택한 페이지 번호
	String pageNum = request.getParameter("pageNum");
	// 최초에 list.jsp를 호출하면 pageNum을 전달할 수 없기 때문에  null이 되고 연산할 때 연산이 되지 않는 문제가 발생할 수 있기 때문에
	// 최초 호출인 경우 무조건 1 페이지로 설정
	if(pageNum == null) {
		pageNum = "1";
	}
	
	// 한 화면에 몇 개의 글(행, 레코드)를 보여줄지 지정
	int rowCount = 10;
	
	// 한 화면에 몇 개의 페이지를 보여줄지 지정
	int pageCount = 10;
	
	// 현재 선택한 페이지(String -> int)
	int currentPage = Integer.parseInt(pageNum);
	
	StoryDAO dao = StoryDAO.getInstance();
	
	int count = dao.getCount();
	
	PagingUtil util = new PagingUtil(currentPage, count, rowCount, pageCount, "list.jsp");
	
	List<StoryVO> list = null;
	if(count>0 ){
		list = dao.getList(util.getStartRow(), util.getEndRow());	
	}	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 이야기</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">
</head>
<body>
<%
	String employee_id = (String)session.getAttribute("employee_id");
	String employee_name = (String)session.getAttribute("employee_name");
%>
<div class="page-main">
	<h1>사원 이야기</h1>
	<div class="align-right">
		<a href="list.jsp">사원 관리 메인</a>
	<%
		if(employee_id==null){ // 로그인 실패
	%>
		<a href="registerForm.jsp">사원 등록</a>
		<a href="loginForm.jsp">로그인</a>
	<%
		} else { // 로그인 성공
	%>
		<a href="myPage.jsp">MyPage</a>
		[<b><%= employee_name%></b>님이 로그인 중]
		<a href="logout.jsp">로그아웃</a><br>
		
	
	</div>
	<div class="align-left">
			<input type="button" value="글 쓰기" onclick="location.href='writeForm.jsp'">
	</div>
	<%	
		}
	%>
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
<%
    for(StoryVO vo : list){
%>
        <tr>
            <td><%= vo.getSnum() %></td>
<%
        EmployeeDAO employeeDAO = EmployeeDAO.getInstance();
        String name = employeeDAO.findEmployeeName(vo.getNum());
%>
            <td><a href="detail.jsp?snum=<%= vo.getSnum() %>"><%=vo.getTitle() %></a></td>
            <td><%= name %></td>
            <td><%= vo.getReg_date() %></td>
        </tr>
<%
    } // for 루프의 끝
%>
		
		
	</table>
	<div class="align-center">
				<%=util.getPage() %>
			</div>
</div>
</body>
</html>
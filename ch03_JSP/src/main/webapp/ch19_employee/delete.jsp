<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%@ page import="kr.story.vo.StoryVO" %>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<%@ page import="kr.employee.vo.EmployeeVO" %>
<%
	
request.setCharacterEncoding("utf-8");
	

	int snum = 0;
	snum= Integer.parseInt(request.getParameter("snum"));
	String passwd = request.getParameter("passwd");
	String id = (String)session.getAttribute("employee_id");
	
	StoryDAO dao = StoryDAO.getInstance();
	// 비밀번호 인증을 위해 기본키를 전달해서 한 건의 레코드를 전달받음
	StoryVO db_board = dao.getStory(snum);
	
    boolean check = false;
    
    EmployeeDAO empdao = EmployeeDAO.getInstance();
    EmployeeVO empvo = empdao.checkEmployee(id);
    
    check = empvo.isCheckedPassword(passwd);
    
    // 비밀번호 일치한다면
    if(check){
        dao.delete(snum);
%>
		<script>
			alert('글 삭제 완료');
			location.replace('list.jsp');
		</script>
<%
		
	} else{ // 인증 실패
%>
	<script>
		alert('비밀번호 불일치');
		history.go(-1);
	</script>
<%
	}
%>

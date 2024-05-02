<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<%@ page import="kr.employee.vo.EmployeeVO" %>
<%
    Integer employee_num = (Integer) session.getAttribute("employee_num");
	String employee_id = (String) session.getAttribute("employee_id");
    if(employee_num==null) { // 로그인 안 되어 있음
        response.sendRedirect("loginForm.jsp");
    } else { // 로그인되어 있음
        request.setCharacterEncoding("utf-8");
        // 전송된 데이터 반환
        String id = request.getParameter("id");
        String passwd = request.getParameter("passwd");
        
        // id와 비밀번호 일치여부
        EmployeeDAO dao = EmployeeDAO.getInstance();
        EmployeeVO vo = dao.checkEmployee(id);
        boolean check = false;
        
        // 아이디가 등록되어 있고, 내가 입력한 아이디와 같다면
        if(vo != null && vo.getId().equals(employee_id)){ 
            // 비밀번호 체크
            check = vo.isCheckedPassword(passwd);
        }
        
        // 비밀번호까지 일치한다면
        if(check){
            // 사원 정보 삭제
            dao.deleteEmployee(vo.getNum());
            // 수정된 부분: 사원 정보 삭제 후 세션 만료
            session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 삭제</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" type="text/css">
</head>
<body>
    <div class="page-main">
        <h1>사원 정보 삭제 완료</h1>
        <div class="result-display">
            <div class="align-center">
                사원 정보 삭제 성공!
                <p>
                    <button onclick="location.href='main.jsp'">홈으로</button>
            </div>
        </div>
    </div>
</body>

<%
		} else {
%>
		<script type="text/javascript">
			alert('아이디와 비밀번호가 불일치합니다.');
			history.go(-1);
		</script>
<%
		}
	}
%>
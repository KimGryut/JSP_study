<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="kr.practice.vo.PracticeVO" %>
<%@ page import="kr.practice.dao.PracticeDAO" %>
<%
	//전송된 데이터 인코딩 타입 지정
	request.setCharacterEncoding("utf-8");
	
	//전송된 데이터 반환
	String id = request.getParameter("id");
	
	PracticeDAO dao = PracticeDAO.getInstance();
	PracticeVO vo = dao.checkId(id);
	if(vo!=null) { // 아이디 중복
%>
	{"result" : "idDuplicated"}
<%
	} else { // 아이디 미중복
%>
	{"result": "idNotFound"}
<%
	}
%>
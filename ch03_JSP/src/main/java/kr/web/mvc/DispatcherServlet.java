package kr.web.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DispatcherServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		requestPro(request, response);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		requestPro(request, response);
	}
	

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
	public void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Action com = null;
		String view = null; // jsp 경로
		
		String command = request.getRequestURI();
		System.out.println("가공 전: " + command); //컨텍스트 경로부터 읽어옴 -> /CH03_JSP 부터
		if(command.indexOf(request.getContextPath())==0){ // 컨텍스트 경로가 맨앞에 있는가? 
			command = command.substring(request.getContextPath().length()); // 컨텍스트 경로가 끝나는 지점부터 마지막까지만 남기고 자르겠다 -> 즉, 컨텍스트 경로 삭제
			System.out.println("가공 후: " + command); // 컨텍스트 경로가 잘리고 나머지가 남았다는 걸 확인할 수 있음
		} 
		
		if(command.equals("/list.do")) {
			com = new ListAction();
		} else if(command.equals("/write.do")) {
			com = new WriteAction();
		} else if(command.equals("/detail.do")) {
			com = new DetailAction();
		} else if(command.equals("/update.do")) {
			com = new UpdateAction();
		} else if(command.equals("/delete.do")) {
			com = new DeleteAction();
		}

		try {
			view = com.execute(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
		// forward 방식으로 view (jsp) 호출
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		
		
	}
}

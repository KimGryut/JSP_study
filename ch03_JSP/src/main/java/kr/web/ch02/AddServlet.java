package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException; // 추가해야 함
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/add")
public class AddServlet extends HttpServlet {
	@Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	/*
    	 * [실습]
    	 * 두 개의 숫자가 전송되면 전송된 두 개의 숫자를 더해서 결과를 구하시오.
    	 * 
    	 * [출력예시]
    	 * 5+2=7
    	 * */
        // 문서 타입 및 캐릭터 셋 지정
        response.setContentType("text/html;charset=utf-8");
        
        int num1 = Integer.parseInt(request.getParameter("num1"));
        int num2 = Integer.parseInt(request.getParameter("num2"));
        
        // html 출력을 위한 출력 스트림 생성
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>Hello Servlet</title></head>");
        out.println("<body>");
        out.println("<p>" + num1 +"+"+ num2 +"="+ (num1+num2) + "</p>");
        out.println("</body>");
        out.println("</html>");
        
        // 자원 정리
        out.close();
        
    }
}
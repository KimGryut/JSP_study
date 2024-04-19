package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException; // 추가해야 함
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/num")
public class numServlet extends HttpServlet {
	@Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	/*
    	 * [실습]
    	 * 전송된 정수 값이 짝수면 짝수입니다 홀수면 홀수입니다 출력
    	 * */
        // 문서 타입 및 캐릭터 셋 지정
        response.setContentType("text/html;charset=utf-8");
        
        int num = Integer.parseInt(request.getParameter("num"));
        
        // html 출력을 위한 출력 스트림 생성
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>짝 홀수 구하기</title></head>");
        out.println("<body>");
        if(num%2==0) {
        	out.println("짝수입니다.");
        } else {
        	out.println("홀수입니다.");
        }
        out.println("</body>");
        out.println("</html>");
        
        // 자원 정리
        out.close();
        
    }
}
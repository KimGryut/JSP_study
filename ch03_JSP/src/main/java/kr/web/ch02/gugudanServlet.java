package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException; // 추가해야 함
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/gugudan")
public class gugudanServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	
        // 문서 타입 및 캐릭터 셋 지정
        response.setContentType("text/html;charset=utf-8");
        
        int dan = Integer.parseInt(request.getParameter("dan"));
        
        // html 출력을 위한 출력 스트림 생성
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>Hello Servlet</title></head>");
        out.println("<body>");
        out.println(dan + "단<br>");
        out.println("----------------<br>");
        for(int i=1; i<=9; i++) {
        	out.println(dan + "*" + i + "=" + dan*i + "<br>");
        }
        out.println("</body>");
        out.println("</html>");
        
        // 자원 정리
        out.close();
        
    }
}
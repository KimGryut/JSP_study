package kr.web.ch01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException; // 추가해야 함
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 호출 주소 지정
@WebServlet("/helloServlet")
//일반 클래스를 서블릿으로 사용할 경우 HttpServlet를 상속시켜야 함
public class HelloServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        // 문서 타입 및 캐릭터 셋 지정
        response.setContentType("text/html;charset=utf-8");
        
        // html 출력을 위한 출력 스트림 생성
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>Hello Servlet</title></head>");
        out.println("<body>");
        out.println("처음 작성하는 servlet입니다.");
        out.println("</body>");
        out.println("</html>");
        
        // 자원 정리
        out.close();
        
    }
}
package kr.web.ch01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException; // 추가해야 함
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hundred")
public class HundredServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1부터 100까지의 합을 계산
        int sum = 0;
        for (int i = 1; i <= 100; i++) {
            sum += i;
        }
        
        // 문서 타입 및 캐릭터 셋 지정
        response.setContentType("text/html;charset=utf-8");

        // HTML 출력을 위한 PrintWriter 객체 생성
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>1부터 100까지의 합</title></head>");
        out.println("<body>");
        out.println("<p>1부터 100까지의 합: " + sum + "</p>");
        out.println("</body>");
        out.println("</html>");

        // PrintWriter 객체 닫기
        out.close();
    }
}


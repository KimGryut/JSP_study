
package kr.web.ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException; // 추가해야 함
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 호출 주소 지정
@WebServlet("/board")
//일반 클래스를 서블릿으로 사용할 경우 HttpServlet를 상속시켜야 함
public class BoardServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	/*
    	 * [실습]
    	 * name, title, content를 전달 받아서 아래와 같이 출력하시오
    	 * 
    	 * [출력예시]
    	 * 이름 : 홍길동
    	 * 제목 : 봄봄봄
    	 * 내용 : 무더위 시작
    	 * */
    	
        // 문서 타입 및 캐릭터 셋 지정
        response.setContentType("text/html;charset=utf-8");
        
        // post 방식으로 데이터를 전송할 경우 인코딩 타입 지정
        request.setCharacterEncoding("utf-8");
        
        String name =request.getParameter("name");
        String title=request.getParameter("title");
        String content =request.getParameter("content");
        // html 출력을 위한 출력 스트림 생성
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>Hello Servlet</title></head>");
        out.println("<body>");
        out.println("이름 : " + name+ "<br>");
        out.println("제목 : " +  title + "<br>");
        out.println("내용 : " + content + "<br>");
        out.println("</body>");
        out.println("</html>");
        
        // 자원 정리
        out.close();
        
    }
}
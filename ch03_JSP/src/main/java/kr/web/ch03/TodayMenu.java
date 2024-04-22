package kr.web.ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException; // 추가해야 함
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/todayMenu")
public class TodayMenu extends HttpServlet {
	@Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	
		// 문서 타입 및 캐릭터 셋 지정
        response.setContentType("text/html;charset=utf-8");
        
        // post 방식으로 데이터를 전송할 경우 인코딩 타입 지정
        request.setCharacterEncoding("utf-8");

        // html 출력을 위한 출력 스트림 생성
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>점심 메뉴</title></head>");
        out.println("<body>");
        out.print("<h3>오늘 점심은</h3>");
        String[] values = request.getParameterValues("lunch");
        
        // 배열이 안 만들어졌을 경우(체크 안 했을 때) 체크해줄 필요 있음
        if(values!=null) { // 전송된 데이터가 있는 경우
        	for(int i=0; i< values.length;i++) {
            	out.print(values[i]+"<br>");
            }
        } else { // 없는 경우
        	out.print("선택한 점심 메뉴가 없습니다.");
        }
        
        
        
        out.println("</body>");
        out.println("</html>");
        
        // 자원 정리
        out.close();
    }
}
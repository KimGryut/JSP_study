package kr.web.ch04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException; // 추가해야 함
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
                                  
@WebServlet("/lifeCycle")
public class LifeCycle extends HttpServlet {
	int initCnt = 0;
	int serviceCnt = 0;
	int destroyCnt = 0;

	@Override
	public void init() throws ServletException{
		System.out.println("init 메서드는 첫 요청만 허용됨 : " + (++initCnt));
	}

	@Override // 새로고침할 때마다 늘어남
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("service 메서드가 요청될 때마다 호출됨 : " + (++serviceCnt));

		// 문서 타입 및 캐릭터 셋 지정
		response.setContentType("text/html;charset=utf-8");

		// html 출력을 위한 출력 스트림 생성
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head><title>Servlet Life Cycle</title></head>");
		out.println("<body>");
		out.println("서블릿 init() 메서드 호출 횟수 " + initCnt + "<br>");
		out.println("서블릿 service() 메서드 호출 횟수 " + serviceCnt + "<br>");
		
		out.println("</body>");
		out.println("</html>");

		// 자원 정리
		out.close();
	}
	
	@Override
	public void destroy() {
		System.out.println("destroy 메서드는 본 Servlet이 더 이상 사용되지 않을 때만 호출됨 " + (++destroyCnt));
	}
	
}
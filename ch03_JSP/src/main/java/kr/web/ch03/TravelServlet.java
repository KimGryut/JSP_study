package kr.web.ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException; // 추가해야 함
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/travel")
public class TravelServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		// 문서 타입 및 캐릭터 셋 지정
		response.setContentType("text/html;charset=utf-8");

		// post 방식으로 데이터를 전송할 경우 인코딩 타입 지정
		request.setCharacterEncoding("utf-8");

		// html 출력을 위한 출력 스트림 생성
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>여행지</title></head>");
		out.println("<body>");

		String[] values = request.getParameterValues("location");
		String name = request.getParameter("name");
		out.print("안녕하세요! " + name + "님!");
		out.print("<h3>당신이 선택한 여행지는</h3>");

		for(int i=0; i< values.length;i++) {
			if(i==values.length-1) {
				out.print(values[i]);
			} else {
				out.print(values[i]+", ");
			}

		} 





		out.println("</body>");
		out.println("</html>");

		// 자원 정리
		out.close();
	}
}
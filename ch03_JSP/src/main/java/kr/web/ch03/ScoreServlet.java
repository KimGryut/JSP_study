package kr.web.ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException; // 추가해야 함
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/score")
public class ScoreServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// 성적 처리
		// 국어, 영어, 수학, 총점, 평균, 등급 출력
		
		// 문서 타입 및 캐릭터 셋 지정
		response.setContentType("text/html;charset=utf-8");

		// post 방식으로 데이터를 전송할 경우 인코딩 타입 지정
		request.setCharacterEncoding("utf-8");

		// html 출력을 위한 출력 스트림 생성
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>성적</title></head>");
		out.println("<body>");

		int korean = Integer.parseInt(request.getParameter("korean"));
		int english = Integer.parseInt(request.getParameter("english"));
		int math= Integer.parseInt(request.getParameter("math"));
		int sum = (korean+english+math);
		
		
		out.print("국어: " + korean + "점 <br>");
		out.print("영어: " + english + "점 <br>");
		out.print("수학: " + math + "점 <br>");
		out.print("총점: " + sum + "점<br>");
		double average = sum / 3.0; // 평균 계산

		String grade;
		if (average >= 90) {
		    grade = "A";
		} else if (average >= 80) {
		    grade = "B";
		} else if (average >= 70) {
		    grade = "C";
		} else if (average >= 60) {
		    grade = "D";
		} else {
		    grade = "F";
		}
		out.print("등급: " + grade);



		out.println("</body>");
		out.println("</html>");

		// 자원 정리
		out.close();
	}
}
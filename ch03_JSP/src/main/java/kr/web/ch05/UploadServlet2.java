package kr.web.ch05;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException; // 추가해야 함
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.util.Collection;
/*
 * multiFileSize : 개별 파일의 전송 가능한 최대 크기
 * maxRequestSize : 전송되는 모든 파일의 용량을 합친 최대 크기
 */
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 5,
		maxRequestSize = 1024 * 1024 * 50
		)

@WebServlet("/fileMultiUpload")
public class UploadServlet2 extends HttpServlet {
	@Override 
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 컨텍스트 경로상의 파일 업로드 절대 경로 구하기
		String realFolder = request.getServletContext().getRealPath("/upload");
		
		// 문서 타입 및 캐릭터셋 지정
		response.setContentType("text/html;charset=utf-8");
		
		// POST 방식으로 전송된 데이터 인코딩 타입 지정
		request.setCharacterEncoding("utf-8");
		
		// HTML 출력을 위한 출력 스트림 생성
		PrintWriter out = response.getWriter();
		try {
			out.println("작성자 : " + request.getParameter("name") + "<br>" );
			out.println("제목 : " + request.getParameter("title") + "<br>" );
			out.println("-------------------------------------------------------<br>" );
			/*
			Part part1 = request.getPart("uploadFile1");
			String fileName = part1.getSubmittedFileName();
			if(!fileName.isEmpty()) {
				// 지정한 경로에 파일을 저장
				part1.write(realFolder + "/" + fileName);
				out.println("<img src=\"/ch03_JSP/upload/" + fileName + "\"><br>");
			}
			
			Part part2 = request.getPart("uploadFile2");
			String fileName2 = part2.getSubmittedFileName();
			if(!fileName.isEmpty()) {
				// 지정한 경로에 파일을 저장
				part2.write(realFolder + "/" + fileName2);
				out.println("<img src=\"/ch03_JSP/upload/" + fileName2 + "\">");
			}
			*/
			
			Collection<Part> parts = request.getParts();
			for(Part p : parts) {
				String collectFileName = p.getSubmittedFileName();
				if(collectFileName!=null && !collectFileName.isEmpty()) {
					p.write(realFolder + "/" + collectFileName);
					out.println("<img src=\"/ch03_JSP/upload/" + collectFileName + "\"><br>");
				}
			}
		} catch(IllegalStateException e) {
			out.println("용량 초과");
		}
	}
}

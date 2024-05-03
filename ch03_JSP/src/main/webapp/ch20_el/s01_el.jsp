<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 테스트</title>
</head>
<body>
	<h3>표현언어(EL)의 사용</h3>
	<table border="1" style="width:40%">
		<tr>
			<th>표현식</th>
			<th>값</th>
		</tr>
		<tr>
			<td>\${2+5}</td>
			<td>${2+5}</td>
		</tr>
		<tr>
			<td>\${"10"+5}</td>
			<td>${"10"+5}</td> <!-- EL에서는 자바 문법을 따르지 않아서 문자열 연결 기능은 없고 무조건 연산시킴 -->
		</tr>
		<tr>
			<td>\${"10"+"5"}</td>
			<td>${"10"+"5"}</td>  <!-- 위와 마찬가지 -->
		</tr>
		<tr>
			<td>\${"십"+5}</td>
			<td>에러발생 (넘버포맷예외) => EL에서 +는 연산만</td>  
		</tr>
		<tr>
			<td>\${4/5}</td>
			<td>${4/5}</td> <!-- 자바에선 정수를 정수로 나누는 것이기 때문에 0이 나옴 (소수 안나옴) -->
		</tr>
		<tr>
			<td>\${5/0}</td>
			<td>${5/0}</td> <!-- 자바에선 0으로 나누면 예외 발생하지만, EL에서는 무한대가 나옴 -->
		</tr>
		
		<tr>
			<td>\${2+=5}</td>
			<td>${2+=5}(문자열 연결)</td> <!-- 문자열 붙인 것처럼 작동 -->
		</tr>
		<tr>
			<td>\${"한국" += "서울"}</td>
			<td>${"한국"+="서울"}</td> 
		</tr>		
	</table>
</body>
</html>
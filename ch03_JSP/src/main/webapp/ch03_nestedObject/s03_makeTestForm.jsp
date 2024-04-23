<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼</title>
</head>
<body>
<form action="s04_viewparameter.jsp" method="post">
    이름 : <input type="text" name="name" size="10"><br>
    주소 : <input type="text" name="address" size="30"><br>
    좋아하는 동물 : 
    <input type="checkbox" name="pet" value="dog"> 강아지
    <input type="checkbox" name="pet" value="cat"> 고양이
    <input type="checkbox" name="pet" value="pig"> 돼지
    <br>
    <input type="submit" value="전송">
</form>
</body>
</html>

<!-- 아니 체크 박스 체크 안 하면 get 방식은 아무것도 안 뜨고 post 방식은 null 뜬다는데 안 뜸 문제 있는 듯
s04 코드 강사님 거랑 비교 요망 -->
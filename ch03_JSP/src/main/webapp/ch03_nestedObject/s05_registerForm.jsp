<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[실습] 회원가입 -> 강사 버전</title>
<script type="text/javascript">
window.onload = function() {
    const form = document.getElementById('register');
    
    form.onsubmit = function() {
        const items = document.querySelectorAll('.input-check');
        for (let i = 0; i < items.length; i++) {
            if (items[i].value.trim() === '') {
                const label = document.querySelector('label[for="' + items[i].id + '"]');
                if (label) {
                    alert(label.textContent + ' 항목은 필수 입력');
                } else {
                    alert('필수 입력 항목을 확인해주세요.');
                }
                items[i].value = '';
                items[i].focus();
                return false;
            }
            
            // 아이디 필드에 대한 유효성 검사
            if(items[i].name === "id") {
                if(!/^[A-Za-z0-9]{4,12}$/.test(items[i].value)) { // 불일치
                    alert('아이디는 영문 또는 숫자만 사용. 4자~12자');
                    items[i].value = '';
                    items[i].focus();
                    return false;
                }
            }
        }
        return true; // 모든 필드가 유효할 때 제출 허용
    };
};

</script>
</head>
<body>
<%--
   이름(name), 아이디(id), 비밀번호(password), 전화번호(phone), 
   취미(hobby) -> checkbox -> 영화 보기, 음악 감상, 등산, 낚시, 춤 (여러 개 선택 가능)
   자기소개(content) => textarea
   
   => s06_register.jsp로 전송 post 방식
   
   출력 예시
   이름 : 홍길동 *필수
   아이디 : 어쩌구 *필수
   비밀번호 : 어쩌구 *필수
   전화번호 : 010-2222-2222
   자기소개 : 진짜 집에 가고 싶은 사람
   
   조건 체크 : 필수 입력
 --%>
 
    <form action="s06_register.jsp" method="post" id="register">
        <label for="name">이름:</label> <input type="text" name="name" size="15" class="input-check"><br>
        <label for="id">아이디 :</label> <input type="text" name="id" size="20" class="input-check"><br>
        <label for="password">비밀번호 :</label> <input type="password" name="password" size="20" class="input-check"> <br>
        <label for="phone">전화번호 :</label> <input type="text" name="phone" size="14" id="phone">  <br>
        취미 :
        <input type="checkbox" name="hobby" value="영화 감상"> 영화 감상
        <input type="checkbox" name="hobby" value="음악 감상"> 음악 감상
        <input type="checkbox" name="hobby" value="등산"> 등산
        <input type="checkbox" name="hobby" value="낚시"> 낚시
        <input type="checkbox" name="hobby" value="춤"> 춤
        <br>자기소개<br>
        <textarea rows="10" cols="50" name="content"></textarea> 
        <input type="submit" value="전송">
    </form>
</body>
</html>

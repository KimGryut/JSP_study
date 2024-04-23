<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[실습] 회원가입</title>
<script type="text/javascript">
    window.onload = function() {
    	 const form=document.getElementById('register');
    	 
    	 form.onsubmit = function(){
    		 const name = document.getElementById("name");
    		 if(name.value.trim()==''){
    			 alert('이름은 필수 입력 항목입니다.');
    			 name.value='';
    			 name.focus();
    			 return false;
    		 }
    		 
    		 const id = document.getElementById("id");
    		 if(!/^[A-Za-z0-9]{4,12}$/.test(id.value)){ // 불일치
                 alert('아이디는 영문 또는 숫자만 사용. 4자~12자');
                 id.value='';
                 id.focus();
                 return false;
             }
    		 
    		 const password = document.getElementById("password");
    		 if(!/^[A-Za-z0-9!@#$%^*+=-]{4,12}$/.test(password.value)){ 
                 alert('비밀번호는 영문, 특수문자, 숫자만 사용. 8자~15자');
                 password.value='';
                 password.focus();
                 return false;
             }
    		 
    		 
    		 const phone=document.getElementById('phone');
    		 if(!/^\d{3}-\d{4}-\d{4}$/.test(phone.value)){ // 불일치
                 alert('전화번호는 000-0000-0000 형식으로 입력하세요');
                 phone.value='';
                 phone.focus();
                 return false;
             }
    		 
    		 return true;
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
 
    <form action="s06_register2.jsp" method="post" id="register">
        이름: <input type="text" name="name" size="15" id="name"> 필수 입력<br>
        아이디 : <input type="text" name="id" size="20" id="id"> 영문 또는 숫자 (4~12자)<br>
        비밀번호 : <input type="password" name="password" size="20" id="password"> 영문 또는 숫자, 특수문자 사용 가능 (4~12자)<br>
        전화번호 : <input type="text" name ="phone" size="14" id="phone"> 000-0000-0000 <br>
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
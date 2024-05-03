<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 메인</title>

<style type="text/css">
*{
	margin: 0;
	padding: 0;	
}

body{
	background-color: #e0f8ff;
}

.title{
	color: #005d96;
}

.main-page{
	margin: auto;
	margin-top:100px;
	text-align : center;
	width: 400px;
	height: 450px;
}

.in-page{
	background-color: white;
	border-radius : 10px;
	margin-top:20px;
	border : 1px  solid #b3eeff;
	height : 280px;
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
}

.login-page{
	position: absolute;
}

.register-page{
	left : 50px;
	bottom : 15px;
	position: absolute;
}

.findId-page{
	transform: translateX(-50%);
	left: 50%;
	bottom : 15px;	
	position: absolute;
}

.findPw-page{
	right: 50px;
	bottom : 15px;	
	position: absolute;
}

#id{
	padding : 5px;
	border : 1px  solid #b3eeff;
	width: 202px;
	height : 36px;
	border-radius : 10px;
}

#pw{
	padding : 5px;
	border : 1px  solid #b3eeff;
	margin-top: 5px;
	width: 202px;
	height : 36px;
	border-radius : 10px;
}

#register_btn, #findId_btn, #findPw_btn {
    border: 0;
    background-color: transparent;
    color: #004c7a;
}

#login-btn{
	border: 1px solid #54d9ff;
    background: #b3eeff;
    border-radius: 10px;
	margin-top:20px;
	width: 220px;
	height: 45px;
	color:#004c7a;
	
}

input:focus {
	outline : 1px  solid #0dc6ff;
}


</style>
<script type="text/javascript">
	window.onload = function(){
		const loginForm = document.getElementById('login_form');
		loginForm.onsubmit = function(){
			const items = document.querySelectorAll('.input-items');
			for(let i=0; i<items.length; i++) {
				if(items[i].value.trim()==''){
					alert(items[i].placeholder + '는 필수 입력 사항입니다.');
					items[i].value='';
					items[i].focus();
					return false;
				}
			}
		}
		const inputId = document.getElementById('id');
		
		// 이벤트 로직
		inputId.addEventListener('input', function() {
		    if(inputId.value.includes(' ')){
		        alert('아이디는 공백을 포함할 수 없습니다.');
		        inputId.value = inputId.value.replace(/\s/g, '');
		    }
		    if(/[^\w\s]/.test(inputId.value)) {
		        alert('아이디는 알파벳과 숫자만 사용 가능합니다.');
		        inputId.value = inputId.value.replace(/[^\w\s]/g, '');
		    }
		});

		
		const inputPw = document.getElementById('pw');
		inputPw.addEventListener('input', function() {
			if(inputPw.value.includes(' ')){
				alert('비밀번호는 공백을 포함할 수 없습니다.');
				 inputPw.value = inputPw.value.replace(/\s/g, '');
			}
		});
	};
</script>

<body>
	
	<div class="main-page">
		<h1 class="title">까꿍 컴퍼니</h1>
		<div class="in-page">
			<div class="login-page">
				<form action="login.jsp" method="post" id="login_form">
					<input type="text" name="id" id="id" maxlength="12" placeholder="&nbsp&nbsp아이디" class="input-items"> <br>
					<input type="password" name="pw" id="pw" maxlength="12" placeholder="&nbsp&nbsp비밀번호" class="input-items"> <br>
					<input type="submit" id="login-btn" value="로그인">	
				</form>
			</div>
			
			<div class="register-page">
					<button onclick="location.href='registerForm.jsp'" id="register_btn">회원가입</button>
			</div>
			<div class="findId-page">
					<button onclick="location.href='findIdForm.jsp'" id="findId_btn">아이디 찾기</button>
			</div>
			<div class="findPw-page">
					<button onclick="location.href='findPwFrom.jsp'" id="findPw_btn">비밀번호 찾기</button>
			</div>
		</div>
	</div>	
</body>
</html>
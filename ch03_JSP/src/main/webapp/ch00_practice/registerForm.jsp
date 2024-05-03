<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 메인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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

.register-page{
    position: absoulte; /* 상대적인 위치로 설정 */
}

.input-items {
    position: absolute; /* 절대적인 위치로 설정 */
    width: 202px;
    height: 36px;
    border: 1px solid #b3eeff;
    border-radius: 10px;
    padding: 5px;
}

#id {
    top: 40px; /* 위쪽 여백 설정 */
    transform: translateX(-50%);
	left: 50%;
}

#pw {
    top: 93px; /* 위쪽 여백 설정 */
    transform: translateX(-50%);
	left: 50%;
}

#name {
    top: 150px; /* 위쪽 여백 설정 */
    transform: translateX(-50%);
	left: 50%;
}

#register_btn {
    position: absolute; /* 절대적인 위치로 설정 */
    bottom: 10px; /* 아래쪽 여백 설정 */
   transform: translateX(-50%);
	left: 50%;
    width: 220px;
    height: 45px;
    border: 1px solid #54d9ff;
    background: #b3eeff;
    border-radius: 10px;
    color: #004c7a;
}



#id{
	padding : 5px;
	border : 1px  solid #b3eeff;
	width: 202px;
	height : 36px;
	border-radius : 10px;
}

#pw, #name{
	padding : 5px;
	border : 1px  solid #b3eeff;
	margin-top: 5px;
	width: 202px;
	height : 36px;
	border-radius : 10px;
}


input:focus {
	outline : 1px  solid #0dc6ff;
}

</style>
<script type="text/javascript">
	window.onload = function(){
		const registerForm = document.getElementById('register_form');
		registerForm.onsubmit = function(){
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
		    $.ajax ({
		    	url : 'confirmId.jsp',
		    	type:'post',
		    	data:{id:$('#id').val()},
		    	dataType:'json',
		    	success: function(param){
		    		if(param.result == 'idDuplicated'){
		    			$('#id').css('color', 'red');
		    			$('#register_btn').css('display', 'none');
		    		} else if (param.result=='idNotFound'){
		    			$('#id').css('color', 'black');
		    			$('#register_btn').css('display', 'block');
		    		} else {
		    			alert('아이디 중복 체크 오류')
		    		}
		    	},
		    	error : function(){
		    		alert('네트워크 오류 발생');
		    	}
		    	
		    })
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
		<h1 class="title">회원가입</h1>
		<div class="in-page">
			<div class="register-page">
				<form action="register.jsp" method="post" id="register_form">
					<input type="text" name="id" id="id" maxlength="12"
						placeholder="&nbsp&nbsp아이디" class="input-items"> <br>
					<input type="password" name="pw" id="pw" maxlength="12"
						placeholder="&nbsp&nbsp비밀번호" class="input-items"> <br>
					<input type="text" name="name" id="name" placeholder="&nbsp&nbsp이름" class="input-items"> <br>
					<input type="submit" id="register_btn" value="회원가입">
				</form>
			</div>
		</div>
	</div>
</body>
</html>
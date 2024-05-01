<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		// 아이디 중복 체크 결과 -> 0: 아이디 중복 체크 미실시 (아이디 중복), 1: 아이디 미중복
		let count = 0;
		
		// 공백 입력 불가하게 하는 것
		 $('#id').on('input', function() {
		        var input = $(this).val();
		        if (input.includes(' ')) {
		            alert('공백을 입력할 수 없습니다.');
		            $(this).val(input.replace(/\s/g, '')); // 공백 제거
		            // 정규 표현식 시작 슬래시 
		            // \s : 공백 문자 (공백, 탭, 줄바꿈)
		            // 정규 표현식 끝 슬래시
		            // g : global의 약자 -> 문자열 전체에서 패턴과 일치하는 모든 문자열 찾아줌
		            // '' : 찾은 공백 문자열을 빈 문자열로 대체하여 제거
		        }
		    });
		
		$('#confirm_id').click(function(){
			if($('#id').val().trim()==''){
				alert('아이디를 입력하세요');
				$('#id').val('').focus();
				return;
			}
			
			// 서버와 통신
			$.ajax({
				url: 'confirmId.jsp',
				type: 'post',
				data:{id:$('#id').val()},
				dataType: 'json',
				success: function(param){
					if(param.result == 'idDuplicated'){
						count =0;
						$('#id_signed').text('아이디 중복').css('color', 'red');
						$('#id').val('').focus();
					} else if(param.result == 'idNotFound'){
						count = 1;
						$('#id_signed').text('사용 가능 아이디').css('color', 'black');
						
					} else {
						count = 0;
						alert('아이디 중복 체크 오류');
					}
				},
				error : function(){
					count = 0;
					alert('네트워크 오류 발생');
				}
			});
		});
		
		// 아이디 입력창에 데이터를 입력하면 중복체크 관련 정보 초기화
		$('#register_form #id').keydown(function(){
			count = 0;
			$('#id_signed').text('');
		});
		
		
		// 기본 이벤트를 제거하고 싶을 때는 return false
		// 그냥 그전으로 돌아갈 때는 return
		$('#register_form').submit(function(){
			const items = document.querySelectorAll('.input-check');
			for(let i=0; i<items.length; i++){
				if(items[i].value.trim()==''){
					const label = document.querySelector('label[for="'+items[i].id+'"]');
					alert(label.textContent + ' 항목은 필수 입력');
					items[i].value = '';
					items[i].focus();
					return false;
				}
				
				if(items[i].id == 'id' && count==0){
					alert('아이디 중복 체크 필수');
					return false;
				}
			}
		});
	});
</script>
</head>
<body>
	<div class="page-main">
		<h1>회원가입</h1>
		<form action="registerUser.jsp" method="post" id="register_form">
			<ul>
				<li>
					<label for="id">아이디</label>
					<input type="text" name="id" id="id" class="input-check" size="7" maxlength="12" autocomplete="off">
					<input type="button" id="confirm_id" value="ID중복확인">
					<span id = "id_signed"></span>
				</li>
				<li>
					<label for="name">이름</label>
					<input type="text" name="name" id="name" class="input-check" maxlength="10">
				</li>
				<li>
					<label for="passwd">비밀번호</label>
					<input type="password" name="passwd" id="passwd" class="input-check" maxlength="12">
				</li>
				<li>
					<label for="email">이메일</label>
					<input type="email" name="email" id="email" class="input-check" maxlength="50">
				</li>
				<li>
					<label for="phone">휴대폰 번호</label>
					<input type="text" name="phone" id="phone"maxlength="15">
				</li>
			</ul>
			<div class = "align-center">
				<input type="submit" value="등록">
				<input type="button" value = "홈으로" onclick="location.href='main.jsp'">
			</div>
		</form>
	</div>
</body>
</html>
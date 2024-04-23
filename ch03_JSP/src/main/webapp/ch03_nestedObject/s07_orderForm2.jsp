<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[실습] 상품 구매</title>
<script type="text/javascript">
window.onload = function() {
    const price = {
        0: 200000,
        1: 100000,
        2: 50000,
        3: 150000,
    };
    
    let sum = 0;
    
    let ship = 0;
    
    const inputs = document.querySelectorAll('input[type="checkbox"]');
    
    for (let i = 0; i < inputs.length; i++) {
        inputs[i].onclick = function() {
            if (this.checked) { // 체크박스 선택
                sum += price[i];
            } else { // 체크박스 해제
                sum -= price[i];
            }
            
            // 배송비 구하기
            if (sum > 0 && sum < 300000) {
                ship = 5000;
            } else {
                ship = 0;
            }
            
            const spans = document.getElementsByTagName('span');
            spans[0].innerHTML = sum.toLocaleString();
            spans[1].innerHTML = ship.toLocaleString();
            spans[2].innerHTML = (sum + ship).toLocaleString();
        };
    }
    
    const myForm = document.getElementById('myForm');
    myForm.onsubmit = function() {
    	const items = document.querySelectorAll('.checking');
    	for (let i = 0; i < items.length; i++) {
    	    if (items[i].value.trim() === '') {
    	        const label = document.querySelector('label[for="' + items[i].id + '"]');
    	        if (label) {
    	            alert(label.textContent + ' 항목은 필수 입력');
    	        } else {
    	            alert('필수 입력 항목을 확인해주세요.');
    	        }
    	        items[i].focus();
    	        return false;
    	    }
    	}

        // 상품이 하나 이상 선택되었는지 확인
        const checkedBoxes = document.querySelectorAll('input[type="checkbox"]:checked');
        if (checkedBoxes.length === 0) {
            alert("상품을 하나 이상 선택해주세요.");
            return false; // 폼 전송 취소
        }

        // totalPrice와 shippingFee 설정
        const totalPrice = sum + ship;
        document.getElementById('totalPrice').value = totalPrice;
        document.getElementById('shippingFee').value = ship;
    };
};
</script>
</head>
<body>
<%--
이름, 배송희망일 필수 입력, 상품은 하나 이상 꼭 선택

출력예시
구매 금액이 30만원 미만이면 배송비 5천원 추가
이름 : 홍길동
배송희망일 : 2024-04-23
구입 내역 : 가방, 옷
배송비 : 5,000원
총구매비용(배송비 포함) : 255,000원

 --%>
<form action="s08_order2.jsp" method="post" id="myForm">
    <ul>
        <li>
            <label for="name">이름</label>
            <input type ="text" name="name" id="name" class="checking">
        </li>
        <li>
            <label for="order_date">배송 희망일</label>
            <input type ="date" name="order_date" id="order_date" class="checking">
        </li>
        <li>
            <label>상품(30만원 미만 배송비 5천원 추가)</label><br>
            <input type ="checkbox" name="item" value="가방"> 가방(20만원)
            <input type ="checkbox" name="item" value="신발"> 신발(10만원)
            <input type ="checkbox" name="item" value="옷"> 옷(5만원)
            <input type ="checkbox" name="item" value="식사권"> 식사권(15만원)
        </li>
    
    </ul>
    총 상품 가격 <span>0</span>원 + 총 배송비 <span>0</span>원
                    = 총 주문금액 <span id="total">0</span>원
    <input type="hidden" name="totalPrice" id="totalPrice">
    <input type="hidden" name="shippingFee" id="shippingFee">
    <input type="submit" value="전송">
</form>
</body>
</html>
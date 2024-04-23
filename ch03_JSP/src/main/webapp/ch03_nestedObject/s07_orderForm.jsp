<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[실습] 상품 구매</title>
<script type="text/javascript">
window.onload = function() {
    const myForm = document.getElementById("myForm");
    myForm.onsubmit = function(){
        const name = document.getElementById("name");
        if(name.value.trim() === ''){
            alert('이름을 입력하세요');
            name.focus();
            return false;
        }
        
        const orderDate = document.getElementById("order_date");
        if(orderDate.value === ''){
            alert('배송 희망일을 입력하세요');
            orderDate.focus();
            return false;
        }
        
        const items = document.querySelectorAll('input[name="item"]:checked');
        let check = false; // 수정된 부분
        for(let i = 0; i < items.length; i++){ // 수정된 부분
            check = true;
            break;
        }
        
        if(!check){
            alert('상품은 하나 이상 선택하세요');
            return false;           
        }
    }
};
</script>
</head>
<body>
<form action="s08_order.jsp" method="post" id="myForm">
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
        <input type="submit" value="전송">
    </ul>
</form>
</body>
</html>
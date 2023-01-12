<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!--    <link rel="stylesheet" type="text/css" href="css/home.css">
    <link rel="stylesheet" type="text/css" href="css/tap.css">
    <link rel="stylesheet" type="text/css" href="css/board.css">
    <link rel="stylesheet" type="text/css" href="css/header.css">
    <link rel="stylesheet" type="text/css" href="css/memberInfo.css">-->


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>

<body>
    <div class="card-body bg-white mt-0 shadow">
        <form action="/kakaoPay" method="post" id="updatePoint" name="updatePoint" th:th:object="${userInfo}">
            <input type="hidden" name="mbr_id" id="mbr_id" value="${userInfo.mbr_id}">
            <p style="font-weight: bold">카카오페이로 결제하기</p>
            <div class="form-group">
                <label>결제 금액</label>
                <!-- placeholder 속성 입력한 데이터가 없는 경우 배경으로 나타난다.실제적으로 입력을 100자까지로 지정 -->
                <!-- required 속성을 설정하면 필수입력 사항이된다. -->
                <!-- pattern 속성을 이용한 정규표현식으로 데이터의 유효성 검사를 할 수 있다. -->
                <input type="number" class="form-control" id="select_money" name="select_money" required="required">
            </div>
            <!--<label class="box-radio-input"><input type="radio" name="cp_item" id="1000" value="1000"><span>1,000원</span></label>
            <label class="box-radio-input"><input type="radio" name="cp_item" id="5000" value="5000"><span>5,000원</span></label>
            <label class="box-radio-input"><input type="radio" name="cp_item" id="10000" value="10000"><span>10,000원</span></label>
            <label class="box-radio-input"><input type="radio" name="cp_item" id="15000" value="15000"><span>15,000원</span></label>
            <label class="box-radio-input"><input type="radio" name="cp_item" id="20000" value="20000"><span>20,000원</span></label>
            <label class="box-radio-input"><input type="radio" name="cp_item" id="30000" value="30000"><span>30,000원</span></label>
            <label class="box-radio-input"><input type="radio" name="cp_item" id="40000" value="40000"><span>40,000원</span></label>
            <label class="box-radio-input"><input type="radio" name="cp_item" id="50000" value="50000"><span>50,000원</span></label>
            <p  style="color: #ac2925; margin-top: 30px">카카오페이의 최소 충전금액은 1,000원이며 <br/>최대 충전금액은 50,000원 입니다.</p>-->

            <!--<div type="text" id="select_money" name="select_money"></div>-->
            <button type="button" class="btn btn-lg btn-block  btn-custom" id="charge_kakao">충 전 하 기</button>
        </form>
    </div>
</body>


<script>
    $('#charge_kakao').click(function () {
        // getter
        var IMP = window.IMP;
        IMP.init('imp12527413');
        /*var money = $("input:radio[name='cp_item']:checked").val();
        pt = ${userInfo.mbr_pt} + money;*/
        var money = $("#select_money").val();
        console.log(money);
        IMP.request_pay({
            pg: 'kakaopay',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '주문명 : 주문명 설정',
            amount: money,
            buyer_email: 'ex@naver.com',
            buyer_name: '주문자명',
            buyer_tel: '010-1234-5678',
            buyer_addr: '인천광역시 부평구',
            buyer_postcode: '123-456'
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                alert(msg);
                localStorage.setItem('charge',money);
                updatePoint.submit();
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                alert(msg);
            }
        });
    });
</script>

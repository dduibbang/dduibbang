<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/board.css">
    <link rel="stylesheet" type="text/css" href="css/memberInfo.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<div class="table-responsive">
    <form action="/boardBbangPay" method="post" id="payBbang" name="payBbang">
        <div class="table-wrapper" style="padding-top: 20px">
            <div class="table-title">
            </div>
            <div class="left-info" style="padding-left: 10%">
                <input type="hidden" id="board_sn" name="board_sn">
                <input type="hidden" id="mbr_sn" name="mbr_sn" value="userInfo.mbr_sn">
                <label>결제 금액 : </label>
                <br>
                <label style="line-height: 3;">보유 빵 : </label>
                <br>
                <label>결제 후 남는 빵 : </label>
            </div>

            <div class="right-info" style="margin-bottom: 45px">
                <input type="hidden" name="mbr_id" value="${userInfo.mbr_id}">
                <input type="number" id="pay" name="pay" class="form-control" maxlength="30" style="width: 200px; line-height: 3;" readonly>
                <input type="number" id="beforeB" name="mbr_pt" class="form-control" maxlength="30" style="width: 200px; line-height: 3;" value="${userInfo.mbr_pt}" readonly>
                <input type="number" id="afterB" name="afterB" class="form-control" maxlength="30" onkeyup="passConfirm();" style="width: 200px; line-height: 3;" readonly>
                <div class="col-lg-12" type="text" id="checkmsg" name="checkmsg"></div>
            </div>

        </div>
        <div>
            <input type="button" class="btn-upload" value="결제하기" onclick="PayBbang()" style="margin-top: 50px; margin-left: 150px; margin-right:20px; float: left; padding-left: 20px; padding-right: 20px">
            <input type="button" class="btn-upload" value="충전하기" onclick="location.href='../kakaoPay'" style="margin-top: 50px; margin-left: 0px; margin-right:150px; float: right; padding-left: 20px; padding-right: 20px">
        </div>
    </form>
</div>


    <script>
        window.onload = function(){
            document.getElementById("board_sn").value = opener.document.getElementById("board_sn").value;
            document.getElementById("pay").value = opener.document.getElementById("dlvPay").value;

            var sn = $("#board_sn").val();
            console.log(sn);

            var pay =$("#pay").val();
            console.log(pay);
            var beforeB = $("#beforeB").val();
            var str = parseInt(beforeB) - parseInt(pay);
            console.log(str);
            var checkmsg = document.getElementById("checkmsg");
            var wrongColor ="#ff0000";
            $("#afterB").val(str);
            $("#afterB").html(str);
            if(afterB.value < 0){
                checkmsg.style.color = wrongColor;
                checkmsg.innerHTML = "빵 충전 후 이용해주세요.";
            }

        }
    </script>


    <script>
        function PayBbang(){
            var afterB = $("#afterB").val();
            console.log(afterB);
            //var money = parseInt(afterB);
            if(afterB < 0) {
                console.log(afterB);
                var str = "빵을 충전해주세요."
                alert(str);
                document.location.href="/kakaoPay"; //alert창 확인 후 이동할 url 설정
            }else{
                payBbang.submit();
            }
        }
    </script>

</body>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="header/header.jsp"%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/home.css">
    <link rel="stylesheet" type="text/css" href="../css/header.css">
    <link rel="stylesheet" type="text/css" href="../css/boardPage.css">
    <link rel="stylesheet" type="text/css" href="css/font.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script>
        function alertFun(){
            alert("빵 결제가 필요합니다.");
        }
        var openWin;
        function menuSelect() {
            window.name = "brdPageForm";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            // 이때 "../menu" 가 아닌 그냥 "menu"라 하면 localhost:8081/board/menu 가 되어서 세션으로 brd_sn전달 못함
            openWin = window.open("../menu", "menuForm", "width=590, height=600, top=500px, left=50px");
        }
        function openOrder() {
            window.name = "brdPageForm";
            openWin = window.open("../brdOrder", "orderForm", "width=700, height=900, top=500px, left=50px");
        }
    </script>



</head>


<body style="background-color: #F7C123;">
<div class="Btap" >
    <div class = boardCnt>
        <div id = "mainCnt "style="background: #fef1c6;">
            <div style="display: grid;padding: 40px;margin-right: 30px;padding-bottom: 20px;grid-template-columns: 500px 1fr;">
                <div id="img_div" style="margin-right: 50px;margin-left: 10px;">
                    <img src="/img/${strImg}.jpg" style="width: 400px;" onerror="this.src='https://post-phinf.pstatic.net/MjAyMDA0MjlfNjIg/MDAxNTg4MTQxNjU3NzQz.ZDWTjIfuekjZLxo3CHMoKl6D5yyhJaeiMo0Cb_x_JRcg.Pj0UivY3zH6VL1Z_tg9brZxQ78_kwJez5KH_IBt3gdAg.PNG/%EC%9D%8C%EC%8B%9D_%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8_%EB%8F%84%EB%84%9B_%EA%B7%B8%EB%A6%BC%EA%B7%B8%EB%A6%AC%EA%B8%B0.png?type=w1200';"/>
                </div>
                <div  style="display: grid; grid-template-rows: 0.2fr 0.1fr 1fr 0.1fr;">

                    <div style="display: flex;justify-content: space-between;align-items: stretch;">
                        <div style="display: flex;justify-content: space-between;align-items: baseline;">
                            <input type="hidden" id="board_sn" name="board_sn" value="${brd.brd_sn}">
                            <h3 style="font-weight:bold;margin-top: 0px;margin-bottom: 30px;">${brd.brd_ttl}</h3>
                            <c:if test="${brd.brd_st eq '01'}">
                                <div class="basicBtn" style="background: #b5e2ef">모집 중❗</div>
                            </c:if>
                            <c:if test="${brd.brd_st != '01'}">
                                <div class="basicBtn" style="background: #b5e2ef">모집 완료</div>
                            </c:if>
                            <div class="basicBtn" style="background: #b5e2ef">${brd.brd_ctgr}</div>
                            <div class="basicBtn" style="background: #b5e2ef">${strNm}</div>
                        </div>
                        <input type="hidden" id ="pri" value="${brd.brd_pri}">
                        <h3 class="basicBtn" id="dlv" name="dlv" style="margin-top: inherit;">${brd.brd_pri}</h3>
                    </div>

                    <div style="margin-top: 10px;margin-bottom: 10px;">${brd.rgtr_id}</div>
                    <div style="padding: 20px;background: #f9fcf3;margin: 10px;margin-left: 0px;margin-right: 0px">${brd.brd_cn}</div>

                    <div style="display: flex;justify-content: space-between;align-items: baseline;">
                        <div class="basicBtn" style="background: #b5e2ef">${brd.brd_adr}</div>
                        <div style="display: flex;align-items: baseline;">
                            <div class="basicBtn" style="font-size: 20px;">${brd.brd_end_dt}</div>
                            <div class="basicBtn" style="font-size: 20px;">${authVOListSize+1}/${brd.brd_nn}명</div>
                        </div>
                    </div>

                </div>
            </div>
            <br>
        </div>
        <br>
        <div id="btn-col">
            <button id = "menu-btn" class="basicBtn" onclick="menuSelect()">메뉴</button>
            <c:if test="${authYN eq 'N'}">  <!-- 빵 결제 안한 사람 -->
                <c:if test="${brd.safe_yn eq 'Y'}">
                    <div id="small_btn_col">
                        <input type="text" id="dlvPay" name="dlvPay" readonly>
                        <button style="font-size: 20px;" class="basicBtn" onclick="bbangPay()">빵 결제</button>
                    </div>
                </c:if>
            </c:if>
            <c:if test="${authYN eq 'Y'}">  <!-- 빵 결제 한 사람 -->
                <div class="basicBtn" style="margin-right: 67px;font-size: initial;background: #b5e2ef">결제 완료</div>
            </c:if>
        </div>
        <div style="display: flex; justify-content: center;margin-top: 30px;">
            <c:if test="${authYN eq 'N'}">  <!-- 빵 결제 안한 사람 -->
                <button style="font-size: 20px;width: 1500px;height: 60px;" class="basicBtn" onclick="alertFun()">엔빵 참여하기</button>
            </c:if>
            <c:if test="${authYN eq 'Y'}">  <!-- 빵 결제 한 사람 -->
                <button style="font-size: 20px;width: 1500px;height: 60px;" class="basicBtn" onclick="location.href='../chat'">엔빵 들어가기</button>
                <button style="font-size: 20px;width: 1500px;height: 60px;" class="basicBtn" onclick="openOrder()">주문 현황보기</button>
            </c:if>
        </div>
    </div>
</div>
<script>
    window.onload = function(){
        var pay =$("#pri").val();
        console.log(pay);
        var str = parseInt(pay)/2;
        console.log(str);
        $("#dlvPay").val(str);
        $("#dlvPay").html(str);
        var sn = $("#board_sn").val();
        console.log(sn);
    }
</script>

<script type="text/javascript">
    var openWin;
    function bbangPay(){
        // window.name = "부모창 이름";
        window.name = "boardForm";
        // window.open("open할 window", "자식창 이름", "팝업창 옵션");
        openWin = window.open("../boardBbangPay", "boardBbangPayForm", "width=530, height=550, resizable = no, scrollbars = no");
        //openWin.document.getElementById("board_sn").value = document.getElementById("board_sn").value;
        //openWin.document.getElementById("pay").value = document.getElementById("dlvPay").value;
    }
</script>



</body>

</html>
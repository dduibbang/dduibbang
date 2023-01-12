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
        $(document).ready(function(){
        });
    </script>
</head>


<body style="background-color: #F7C123;">
<div class="Btap" >
    <div class = boardCnt>
        <div id = "mainCnt "style="background: #fef1c6;">
            <div style="display: grid;padding: 40px;padding-bottom: 20px;grid-template-columns: 500px 1fr;">
                <div id="img_div" style="margin-right: 50px;margin-left: 10px;">
                    <img src="/img/${strImg}.jpg" style="width: 400px;" onerror="this.src='https://post-phinf.pstatic.net/MjAyMDA0MjlfNjIg/MDAxNTg4MTQxNjU3NzQz.ZDWTjIfuekjZLxo3CHMoKl6D5yyhJaeiMo0Cb_x_JRcg.Pj0UivY3zH6VL1Z_tg9brZxQ78_kwJez5KH_IBt3gdAg.PNG/%EC%9D%8C%EC%8B%9D_%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8_%EB%8F%84%EB%84%9B_%EA%B7%B8%EB%A6%BC%EA%B7%B8%EB%A6%AC%EA%B8%B0.png?type=w1200';"/>
                </div>
                <div  style="display: grid; grid-template-rows: 0.2fr 0.1fr 1fr 0.1fr;">

                    <div style="display: flex;justify-content: space-between;align-items: stretch;">
                        <div style="display: flex;justify-content: space-between;align-items: baseline;">
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
                        <h3 class="basicBtn" style="margin-top: inherit;">${brd.brd_pri}</h3>
                    </div>

                    <div style="margin-top: 10px;margin-bottom: 10px;">${brd.rgtr_id}</div>
                    <div style="padding: 20px;background: #f9fcf3;margin: 10px;margin-left: 0px;margin-right: 0px">${brd.brd_cn}</div>

                    <div style="display: flex;justify-content: space-between;align-items: baseline;">
                        <div class="basicBtn" style="background: #b5e2ef">${brd.brd_adr}</div>
                        <div style="display: flex;align-items: baseline;">
                            <div class="basicBtn" style="font-size: 20px;">${brd.brd_end_dt}</div>
                            <div class="basicBtn" style="font-size: 20px;">1/${brd.brd_nn}명</div>
                        </div>
                    </div>

                </div>
            </div>
        <br>
    </div>
        <br>
        <div id="btn-col">
            <button id = "menu-btn" class="basicBtn" onclick="location.href='../home'">메뉴</button>
            <div id="small_btn_col">
                <input type="String">
                <button style="font-size: 20px;" class="basicBtn" onclick="">빵 결제</button>
            </div>
        </div>
        <div style="display: flex; justify-content: center;margin-top: 30px;">
        <button style="font-size: 20px;width: 1500px;height: 60px;" class="basicBtn" onclick="location.href='../chat'">엔빵 참여하기</button>
    </div>
</div>
</div>
</body>
</html>
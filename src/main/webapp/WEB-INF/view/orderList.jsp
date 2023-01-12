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
    <link rel="stylesheet" type="text/css" href="../css/tab.css">
    <link rel="stylesheet" type="text/css" href="css/font.css">
    <link rel="stylesheet" type="text/css" href="css/orderList.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<div class="Btap">

    <div>
        <h1>주문현황</h1>
    </div>
    <input  class=input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
    <label for="tab1">안심거래</label>

    <input class=input id="tab2" type="radio" name="tabs">
    <label for="tab2">일반거래</label>

    <section class=tabContents id="content1" style="padding-top: 50px;">
        <div class="boardList">
            <c:forEach items="${YboardList}" var="brd" varStatus="idx">
                <div style="width: 1650px;cursor:pointer;" onclick="location.href='/board/${brd.brd_sn}'">
                    <div class = "mainCnt" style="background: #fef1c6;border-bottom: 20px solid #f9fcf3;">
                        <div style="display: grid;padding: 30px;padding-bottom: 20px;grid-template-columns: 300px 1fr;">
                            <div id="img_div" style="margin-right: 50px;margin-left: 10px;">
                                <img src="/img/${selectVOYList[idx.index].str_img}.jpg" style="width: 250px;" onerror="this.src='https://post-phinf.pstatic.net/MjAyMDA0MjlfNjIg/MDAxNTg4MTQxNjU3NzQz.ZDWTjIfuekjZLxo3CHMoKl6D5yyhJaeiMo0Cb_x_JRcg.Pj0UivY3zH6VL1Z_tg9brZxQ78_kwJez5KH_IBt3gdAg.PNG/%EC%9D%8C%EC%8B%9D_%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8_%EB%8F%84%EB%84%9B_%EA%B7%B8%EB%A6%BC%EA%B7%B8%EB%A6%AC%EA%B8%B0.png?type=w1200';"/>
                            </div>
                            <div  style="display: grid; grid-template-rows: 0.2fr 0.1fr 1fr 0.1fr;">
                                <div style="display: flex;justify-content: space-between;align-items: stretch;">
                                    <div style="display: flex;justify-content: space-between;align-items: baseline;">
                                        <h3 style="font-weight:bold;margin-top: 0px;margin-bottom: 30px;margin-right: 10px;">${brd.brd_ttl}</h3>
                                        <c:if test="${brd.brd_st eq '01'}">
                                            <div class="basicBtn" style="background: #b5e2ef">모집 중❗</div>
                                        </c:if>
                                        <c:if test="${brd.brd_st != '01'}">
                                            <div class="basicBtn" style="background: #b5e2ef">모집 완료</div>
                                        </c:if>
                                        <div class="basicBtn" style="background: #b5e2ef">${brd.brd_ctgr}</div>
                                        <div class="basicBtn" style="background: #b5e2ef">${selectVOYList[idx.index].str_nm}</div>
                                    </div>
                                    <c:if test="${brd.brd_st eq '01'}">
                                        <h3 class="basicBtn" style="margin-top: inherit;">${brd.brd_pri}</h3>
                                    </c:if>
                                    <c:if test="${brd.brd_st != '01'}">
                                        <div style="display: flex;justify-content: space-between;align-items: baseline;">
                                            <a href="#" class="basicBtn" style="background-color: #F7C123; margin-top: inherit;"> 리뷰 작성 </a>
                                            <h3 class="basicBtn" style="margin-top: inherit;">${brd.brd_pri}</h3>
                                        </div>
                                    </c:if>
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
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>

    <section class=tabContents id="content2" style="padding-top: 50px;">
        <!-- 여기부터 board 리스트 표시 -->
        <div class="boardCnt">
            tab1
        </div>
    </section>
</div>

</body>
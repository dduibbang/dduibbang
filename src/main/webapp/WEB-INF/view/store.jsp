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
    <link rel="stylesheet" type="text/css" href="css/store.css">

</head>


<body style="background-color: #F7C123;">
<div class="Btap" style="height: auto">
    <div class = boardCnt>
        <div id = "mainCnt "style="background: #fef1c6;">
            <div style="display: grid;padding: 40px;margin-right: 30px;padding-bottom: 20px;grid-template-columns: 500px 1fr;">
                <div id="img_div" style="margin-right: 50px;margin-left: 10px;">
                    <img src="/img/${str.str_img}.jpg" style="width: 400px;" onerror="this.src='https://post-phinf.pstatic.net/MjAyMDA0MjlfNjIg/MDAxNTg4MTQxNjU3NzQz.ZDWTjIfuekjZLxo3CHMoKl6D5yyhJaeiMo0Cb_x_JRcg.Pj0UivY3zH6VL1Z_tg9brZxQ78_kwJez5KH_IBt3gdAg.PNG/%EC%9D%8C%EC%8B%9D_%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8_%EB%8F%84%EB%84%9B_%EA%B7%B8%EB%A6%BC%EA%B7%B8%EB%A6%AC%EA%B8%B0.png?type=w1200';"/>
                </div>
                <div  style="display: grid; grid-template-rows: 0.2fr 0.1fr 1fr 0.1fr;">

                    <div style="display: flex;justify-content: space-between;align-items: stretch;">
                        <div style="display: flex;justify-content: space-between;align-items: baseline;">
                            <input type="hidden" id="str_sn" name="str_sn" value="${str.str_sn}">
                            <h3 style="font-weight:bold;margin-top: 0px;margin-bottom: 30px;">${str.str_nm}</h3>

                            <div class="basicBtn" style="background: #b5e2ef">${str.str_ctgr}</div>
                        </div>
                    </div>

                    <div style="margin-top: 10px;margin-bottom: 10px;">매장 전화번호 : ${str.str_tel}</div>

                    <div style="display: flex;justify-content: space-between;align-items: baseline;">
                        <div class="basicBtn" style="font-size: 18px;background: #b5e2ef; margin-top: 14.4%;">${str.str_adr}</div>
                        <div style="display: flex;align-items: baseline;">
                            <div class="basicBtn" style="font-size: 20px; background-color:#f9fcf3; padding-right: 20px; padding-left: 20px; margin-top: 7%;">최소 주문 금액 : ${str.str_min} &nbsp;&nbsp;&nbsp; 배달팁 : ${str.str_pri}</div>
                        </div>
                    </div>

                </div>
            </div>
            <br>
        </div>
        <br>

        <div id="btn-col">
            <a id = "menu-btn" class="basicBtn" style="font-size: 20px;width: 1000px; margin-right: auto; margin-left: auto; text-align: center; margin-bottom: 15px">메 &emsp;&emsp;&emsp; 뉴</a>
        </div>
        <!--<div style="overflow:auto;">-->
            <c:forEach items="${menuVOList}" var="menu" varStatus="idx">
                <div style="width: 1500px;cursor:pointer;">
                    <div class = "mainCnt" style="background: #fef1c6;border-bottom: 10px solid #FFFFFF;">
                        <div style="height: 200px;display: grid;padding: 30px;padding-bottom: 20px;grid-template-columns: 230px 1fr;">
                            <div style="margin-right: 50px;margin-left: 10px;">
                                <img src="${menu.menu_prof}" style="width: 200px;" onerror="this.src='https://post-phinf.pstatic.net/MjAyMDA0MjlfNjIg/MDAxNTg4MTQxNjU3NzQz.ZDWTjIfuekjZLxo3CHMoKl6D5yyhJaeiMo0Cb_x_JRcg.Pj0UivY3zH6VL1Z_tg9brZxQ78_kwJez5KH_IBt3gdAg.PNG/%EC%9D%8C%EC%8B%9D_%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8_%EB%8F%84%EB%84%9B_%EA%B7%B8%EB%A6%BC%EA%B7%B8%EB%A6%AC%EA%B8%B0.png?type=w1200';"/>
                            </div>
                            <div  style="display: grid; grid-template-rows: 0.2fr 0.1fr 1fr 0.1fr;">
                                <div style="display: flex;justify-content: space-between;align-items: stretch;">
                                    <h3 style="font-weight:bold;margin-top: 0px;margin-bottom: 30px;margin-right: 10px;">${menu.menu_nm}</h3>
                                    <h3 class="basicBtn" style="margin-top: inherit;">${menu.menu_pr}</h3>
                                </div>

                                <div style="padding: 20px;background: #f9fcf3;margin: 10px;margin-left: 0px;margin-right: 0px">${menu.menu_cn}</div>

                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        <!--</div>-->
        <footer>
            <div style="display: flex;position: sticky">
                <button style="font-size: 25px;width: 70%;height: 60px;" class="basicBtn" onclick="location.href='../board'">엔빵 등록</button>
                <button style="font-size: 25px;width: 30%;height: 60px;" class="basicBtn" onclick="">리뷰 보기</button>
            </div>
        </footer>
    </div>
</div>

</body>


</html>
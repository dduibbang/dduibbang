<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="header/header.jsp"%>
    <link rel="icon" type="image/png" sizes="16x16" href="photo/favicon.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/home.css">
    <link rel="stylesheet" type="text/css" href="css/tab.css">
    <link rel="stylesheet" type="text/css" href="css/board.css">
    <link rel="stylesheet" type="text/css" href="css/header.css">
    <link rel="stylesheet" type="text/css" href="css/font.css">
    <link rel="stylesheet" type="text/css" href="../../docs/css/examples-base.css" />

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=35o7z9sq66&submodules=geocoder"></script>
    <script src="../js/home.js"></script>
    <script>
        $(document).ready(function(){
            console.log(<%= request.getParameter("userInfo")%>);
            getMyAdr();
        });
    </script>

    <meta name="referrer" content="no-referrer" />
</head>
<body>
<br>


<div class="tab">
    <div style="display: flex;justify-content: center;margin-bottom: 20px">
        <div id="adrBar">
            <div id="adr" style="font-family: 'TmoneyRoundWindExtraBold';"></div>
            <a href="/map" class="basicBtn"> 주소 변경 </a>
        </div>
    </div>

    <!-- 여기부터 board 리스트 표시 -->

    <div class = "searchForm">
        <select name="searchCnd" id="searchYCnd" style="height: 40px;margin-left: 5px;margin-right: 10px">
            <option value="0">전체</option>
            <option value="2">음식 종류</option>
            <option value="3">가게명</option>
            <option value="4">주소</option>
        </select>
        <div style="display: flex;">
            <input type="text" id="searchYWrd" name="searchWrd" placeholder="검색어를 입력하세요." onkeyup="emptyNTab()" style="width: 300px;height: 40px;">
            <button class="basicBtn" style="width: 80px; height: 40px;border-radius: 4px;" onclick="search()">검색</button>
        </div>
    </div>

    <div class="table-responsive" style="height: 850px;display: flex;justify-content: center;flex-wrap: wrap;">
        <div>
            <c:forEach items="${storeList}" var="str" varStatus="idx">
                <div style="width: 1650px;cursor:pointer;" onclick="location.href='/store/${str.str_sn}'">
                    <div class = "mainCnt" style="background: #fef1c6;border-bottom: 20px solid #f9fcf3;">
                        <div style="display: grid;padding: 30px;padding-bottom: 20px;grid-template-columns: 300px 1fr;">
                            <div id="img_div" style="margin-right: 50px;margin-left: 10px;">
                                <img src="/img/${str.str_img}.jpg" style="width: 250px; height: 200px" onerror="this.src='https://post-phinf.pstatic.net/MjAyMDA0MjlfNjIg/MDAxNTg4MTQxNjU3NzQz.ZDWTjIfuekjZLxo3CHMoKl6D5yyhJaeiMo0Cb_x_JRcg.Pj0UivY3zH6VL1Z_tg9brZxQ78_kwJez5KH_IBt3gdAg.PNG/%EC%9D%8C%EC%8B%9D_%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8_%EB%8F%84%EB%84%9B_%EA%B7%B8%EB%A6%BC%EA%B7%B8%EB%A6%AC%EA%B8%B0.png?type=w1200';"/>
                            </div>
                            <div  style="grid-template-rows: 0.2fr 0.1fr 1fr 0.1fr;">
                                <div style="display: flex;justify-content: space-between;align-items: stretch;">
                                    <div style="display: flex;justify-content: space-between;align-items: baseline;">
                                        <h3 style="font-weight:bold;margin-top: 0px;margin-bottom: 30px;margin-right: 10px;font-size: 27px;">${str.str_nm}</h3>
                                        <div class="basicBtn" style="background: #b5e2ef">${str.str_ctgr}</div>
                                    </div>
                                </div>
                                <div>
                                    <div style="display: flex;align-items: baseline;">
                                        <div class="basicBtn" style="font-size: 20px; background-color:#f9fcf3; padding-right: 20px; padding-left: 20px;margin-left: 68%; margin-top: 7%;">최소 주문 금액 : ${str.str_min} &nbsp;&nbsp;&nbsp; 배달팁 : ${str.str_pri}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <br>
    <br>


</body>
</html>
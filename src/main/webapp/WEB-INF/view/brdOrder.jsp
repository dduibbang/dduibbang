<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>주문현황</title>

    <link rel="stylesheet" type="text/css" href="css/orderList.css">
    <link rel="stylesheet" type="text/css" href="css/brdOrder.css">
    <link rel="stylesheet" type="text/css" href="css/font.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
        $( document ).ready(function() {
            //var boolSelect = false;
        });

        function selectMenu(){

            var mP = document.getElementById("selectMenu").value;
            var mP = parseInt(mP);
            console.log(mP);
                $("#menuPrice").html(${menuVOList[mP].menu_pr});
        }
    </script>
</head>
<body style="background: #fef1c6;height: 900px;">
<div id = "wholeCnt">
    <div id = "topBar">
        <h1 style="font-family: 'TmoneyRoundWindExtraBold';">주문현황</h1>
        <div class="basicBtn" style="font-size: x-large;margin-left: 10px;background:#b5e2ef"><a href="/brdOrder">🔃</a></div>
    </div>
    <div id ="mainTb">
        <div style="border-bottom: #1c1f23 3px solid;padding-bottom: 20px;padding-top: 20px;">
        <h3 id = "tbCtgr" style="display: grid;grid-template-columns: 120px 70px 70px 170px 100px 70px">
            <div>주문자</div>
            <div>결제</div>
            <div>픽업</div>
            <div>메뉴</div>
            <div>금액</div>
            <div></div>
        </h3>
            <div style="display: grid;row-gap: 20px;grid-template-columns: 120px 70px 70px 170px 100px 70px">
                <c:forEach items="${authUserVOList}" var="authUser" > <!-- 빵 결제를 완료한 사람들 리스트 -->

                    <div>${authUser.mbr_nm}</div> <!-- 닉네임 -->

                    <c:if test="${userInfo.mbr_nm != authUser.mbr_nm}"> <!-- 나말고 다른 엔빵 참여자이면 -->

                        <input type="checkbox" name="payYN" value="">
                        <input type="checkbox" name="pickUpYN" value="" >
                        <div>${user.menu_nm}</div>
                        <div id="menuPrice">${user.menu_pr}</div>
                        <div></div>
                    </c:if>

                    <c:if test="${userInfo.mbr_nm eq authUser.mbr_nm}"> <!-- 본인이라면 -->

                        <input type="checkbox" name="payYN" value="" >
                        <input type="checkbox" name="pickUpYN" value="" >

                        <select name="selectMenu" id="selectMenu" style="height: 40px;margin-left: 5px;margin-right: 10px"onchange="selectMenu()">
                            <option var="-1">메뉴를 선택해주세요.</option>
                            <c:forEach items="${menuVOList}" var="menu" varStatus="idx">
                                <option value="${idx.index}" >${menu.menu_nm}</option>
                            </c:forEach>
                        </select>

                        <div id="menuPrice"></div>
                        <div id="payBtn" style="display: flex">
                            <div>결제</div>
                        </div>
                    </c:if>

                </c:forEach>
            </div>
        </div>
        <div style="display: grid;grid-template-columns: 120px 70px 70px 150px 100px 70px">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div id = "sumPri"></div>
            <div></div>
        </div>
    </div>
    <c:if test="${userInfo.mbr_id eq boardVO.rgtr_id}"> <!-- 방장이면 표시됨, 추후 수정 -->
        <div class="basicBtn" style="font-size: x-large;">주문하기</div>
    </c:if>
</div>

<%--<div>${userInfo.mbr_id}</div>--%>
<%--<div>${menuVOList[0].menu_nm}</div>--%>

<%--<c:forEach items="${menuVOList}" var="menu" varStatus="idx">--%>
<%--    <div style="width: 570px;cursor:pointer;">--%>
<%--        <div class = "mainCnt" style="background: #fef1c6;border-bottom: 10px solid #FFFFFF;">--%>
<%--            <div style="height: 200px;display: grid;padding: 30px;padding-bottom: 20px;grid-template-columns: 230px 1fr;">--%>
<%--                <div style="margin-right: 50px;margin-left: 10px;">--%>
<%--                    <img src="${menu.menu_prof}" style="width: 200px;" onerror="this.src='https://post-phinf.pstatic.net/MjAyMDA0MjlfNjIg/MDAxNTg4MTQxNjU3NzQz.ZDWTjIfuekjZLxo3CHMoKl6D5yyhJaeiMo0Cb_x_JRcg.Pj0UivY3zH6VL1Z_tg9brZxQ78_kwJez5KH_IBt3gdAg.PNG/%EC%9D%8C%EC%8B%9D_%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8_%EB%8F%84%EB%84%9B_%EA%B7%B8%EB%A6%BC%EA%B7%B8%EB%A6%AC%EA%B8%B0.png?type=w1200';"/>--%>
<%--                </div>--%>
<%--                <div  style="display: grid; grid-template-rows: 0.2fr 0.1fr 1fr 0.1fr;">--%>
<%--                    <div style="display: flex;justify-content: space-between;align-items: stretch;">--%>
<%--                        <h3 style="font-weight:bold;margin-top: 0px;margin-bottom: 30px;margin-right: 10px;">${menu.menu_nm}</h3>--%>
<%--                        <h3 class="basicBtn" style="margin-top: inherit;">${menu.menu_pr}</h3>--%>
<%--                    </div>--%>

<%--                    <div style="padding: 20px;background: #f9fcf3;margin: 10px;margin-left: 0px;margin-right: 0px">${menu.menu_cn}</div>--%>

<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</c:forEach>--%>

</body>
</html>
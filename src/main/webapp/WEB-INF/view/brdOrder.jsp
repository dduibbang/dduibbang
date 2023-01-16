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

        var menu;

        function selectMenu(){

            <%--var mP = document.getElementById("selectMenu").value;--%>
            <%--var mP = parseInt(mP);--%>
            <%--console.log(mP);--%>
            <%--    $("#menuPrice").html(${menuVOList[mP].menu_pr});--%>

            menu = document.getElementById("selectMenu").value;
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
                <c:forEach items="${payVOList}" var="payVO" varStatus="idx"> <!-- 빵 결제를 완료한 사람들 리스트 -->
                    <form action="insertPay" method="post" id= "insertForm" name= "insertForm">
                        <p><input type="hidden" name="brd_sn" value="${boardVO.brd_sn}"></p>
                        <p><input type="hidden"  name="mbr_sn" value="${userInfo.mbr_sn}"></p>
                    <div style="display: grid;row-gap: 20px;grid-template-columns: 120px 70px 70px 170px 100px 70px">
                        <div>${mbrVOList[idx.index].mbr_nm}</div> <!-- 닉네임 -->

                        <c:if test="${userInfo.mbr_sn != payVO.mbr_sn}"> <!-- 나말고 다른 엔빵 참여자이면 -->

                            <c:if test="${payVO.pay_yn eq 'Y'.charAt(0)}">
                                <div><input type="checkbox"  name="pay_yn" value="" checked></div>
                            </c:if>
                            <c:if test="${payVO.pay_yn != 'Y'.charAt(0)}">
                                <div>❌</div>
                            </c:if>

                            <c:if test="${payVO.div_yn eq 'Y'.charAt(0)}">
                                <div><input type="checkbox"  name="div_yn" value="" checked></div>
                            </c:if>
                            <c:if test="${payVO.div_yn != 'Y'.charAt(0)}">
                                <div>❌</div>
                            </c:if>

                            <div>${payVO.menu_nm}</div>
                            <div>${payVO.menu_pr}</div>
                            <div></div>
                        </c:if>

                        <c:if test="${userInfo.mbr_sn eq payVO.mbr_sn}"> <!-- 본인이라면 -->


                            <c:if test="${payVO.pay_yn eq 'Y'.charAt(0)}">
                                <div>⭕</div>
                            </c:if>
                            <c:if test="${payVO.pay_yn != 'Y'.charAt(0)}">
                                <div><input type="checkbox" id ="pay_yn" name="pay_yn" value=""></div>
                            </c:if>

                            <c:if test="${payVO.div_yn eq 'Y'.charAt(0)}">
                                <div>⭕</div>
                            </c:if>
                            <c:if test="${payVO.div_yn != 'Y'.charAt(0)}">
                                <div><input type="checkbox" id ="div_yn" name="div_yn" value="" ></div>
                            </c:if>

                            <c:if test="${payVO.menu_nm eq null}">
                                <select name="menu_nm" id="selectMenu" style="height: 40px;margin-left: 5px;margin-right: 10px"onchange="selectMenu()">
                                    <option value="-1">메뉴를 선택해주세요.</option>
                                    <c:forEach items="${menuVOList}" var="menu" varStatus="idx">
                                        <option value="${menu.menu_nm}" >${menu.menu_nm}</option>
                                    </c:forEach>
                                </select>
                            </c:if>
                            <c:if test="${payVO.menu_nm != null}">
                                <div>${payVO.menu_nm}</div>
                            </c:if>

                            <c:if test="${payVO.menu_pr eq null}">
                                <input id="menuPrice" name="menu_pr" value="20000">
                            </c:if>
                            <c:if test="${payVO.menu_pr != null}">
                                <div>${payVO.menu_pr}</div>
                            </c:if>
                        <div id="payBtn" style="margin-top: 5px;margin-left: 20px;display: flex">
                            <div>결제</div>
                        </div>



                        </div>
                            </form>
                        </c:if>
            </div>
                </c:forEach>

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
        <span>
        <span class="basicBtn"  style="cursor:pointer;font-size: x-large;">주문하기</span>
        <span class="basicBtn" onclick="payInsert()" style="cursor:pointer;font-size: x-large;">주문 저장하기</span>
        </span>
    </c:if>
    <c:if test="${userInfo.mbr_id != boardVO.rgtr_id}"> <!-- 방장이면 표시됨, 추후 수정 -->
        <div class="basicBtn" onclick="payInsert()" style="cursor:pointer;font-size: x-large;">주문 저장하기</div>
    </c:if>
</div>
</body>
</html>

<script>
    function payInsert(){
        //$("#selectMenu").val(menu);

        //$("#pay_ent").val(${userInfo.mbr_id});

        if(pay_yn.checked)
            $("#pay_yn").val('Y');
        else
            $("#pay_yn").val('N');

        if(div_yn.checked)
            $("#div_yn").val('Y');
        else
            $("#div_yn").val('N');

        insertForm.submit();
    }
</script>
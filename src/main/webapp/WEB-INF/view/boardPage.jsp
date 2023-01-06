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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script>
        $(document).ready(function(){

        });
    </script>
</head>

<body style="background-color: #F7C123;">
<div class="Btap">
    <div id = boardCnt>
        <div style="background: #fef1c6">
            <img src="${strImg}">
            brd : ${brd.brd_ctgr}
            brd_ttl : ${brd.brd_ttl}
            brd_cn : ${brd.brd_cn}
            brd_pri : ${brd.brd_pri}
            str_sn : ${brd.str_sn}
            brd_img : ${strImg}

        </div>
        <br>
        <div id="btn-col">
            <button id = "menu-btn" class="basicBtn" onclick="location.href='#'">메뉴</button>
            <div id="small_btn_col">
                <input type="String">
                <button style="" class="basicBtn" onclick="">빵 결제</button>
            </div>
        </div>
    </div>
    <br>
    <div style="display: flex; justify-content: center;">
        <button style="width: 1500px;height: 60px;" class="basicBtn" onclick="location.href='#'">엔빵 참여하기</button>
    </div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="header/header.jsp"%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/home.css">
    <link rel="stylesheet" type="text/css" href="css/tap.css">
    <link rel="stylesheet" type="text/css" href="css/board.css">
    <link rel="stylesheet" type="text/css" href="css/header.css">
    <link rel="stylesheet" type="text/css" href="css/memberInfo.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body style="background-color: #F7C123;">
    <div class="tab">
        <br>
        <div style="display: flex; margin-left: 5%">
            <h2>${userInfo.mbr_nm}님의 현재 보유 포인트 </h2>
            <div>
                <label class="mbr-point">${userInfo.mbr_pt} 빵</label>
            </div>
            <div>
                <button type="button" class="btn-point" onclick="kakaoPay">추가 적립</button>
            </div>
        </div>

        <div class="writeDisplay">
            <form action="/memberInfo" method="post">
                <div class="left">
                    <div class="dd-padding form-group">
                        <div class="left-info">
                            <label class="mbr-info">아이디 : </label>
                            <br>
                            <label class="mbr-info">비밀번호 : </label>
                            <br>
                            <label class="mbr-info">이름(닉네임) : </label>
                            <br>
                            <label class="mbr-info"style="line-height: 3;">전화번호 : </label>
                            <br>
                            <label class="mbr-info" style="line-height: 2.5;">이메일 : </label>
                            <br>
                            <label class="mbr-info">등급 : </label>
                        </div>

                        <div class="right-info">
                            <input type="text" class="form-control" id="mbr_id" name="mbr_id" maxlength="30" value="${userInfo.mbr_id}" readonly>
                            <br>
                            <br>
                            <input type="button" class="form-control" style="width: 250px" value="비밀번호 변경하기" onclick="updatePW()">
                            <br>
                            <br>
                            <input type="text" class="form-control" id="mbr_nm" name="mbr_nm" maxlength="30" value="${userInfo.mbr_nm}">
                            <br>
                            <br>
                            <input type="text" class="form-control" id="mbr_tel" name="mbr_tel" maxlength="30" value="${userInfo.mbr_tel}">
                            <br>
                            <br>
                            <input type="text" class="form-control" id="mbr_email" name="mbr_email" maxlength="30" value="${userInfo.mbr_email}">
                            <br>
                            <br>
                            <label class="mbr-info">${userInfo.mbr_gd}</label>
                        </div>
                    </div>
                </div>

                <div class="right" style="padding: 30px">
                    <!--사진-->
                    <div style="width: 200px; height: 200px; background-color: white; margin-right: auto; margin-left: auto"></div>
                    <br>
                    <br>
                    <input type="button" class="btn-upload" value="프로필 사진 변경" onclick="">
                </div>
                <div>
                    <br>
                    <button type="submit" class="btn-upload" style="font-family: 'Nanum Gothic', sans-serif; font-size: 15pt; margin-top: 100px">수정하기</button>
                </div>
            </form>
        </div>

    </div>

    <!--결제창-->
    <script type="text/javascript">
        /*let openWin;*/
        var openWin;

        function kakaoPay() {
            // window.name = "부모창 이름";
            window.name = "myForm";

            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("kakaoPay", "kakappayForm", "width=570, height=800, resizable = no, scrollbars = no");
        }
    </script>

    <script type="text/javascript">
        /*let openWin;*/
        var openWin;

        function updatePW() {
            // window.name = "부모창 이름";
            window.name = "pwForm";

            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("updatePw", "updatePwForm", "width=570, height=300, resizable = no, scrollbars = no");
        }
    </script>
    <!--<script type="text/javascript">
        /*let openWin;*/
        var openWin;

        function openSelectImg() {
            // window.name = "부모창 이름";
            window.name = "InfoForm";

            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("prof", "profForm", "width=570, height=350, resizable = no, scrollbars = no");
        }
    </script>-->

</body>
</html>


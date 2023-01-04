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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body style="background-color: #F7C123;">
    <div class="tab">
        <br>
        <div style="display: flex;">
            <h1>${userVO.mbr_nm}님의 현재 보유 포인트 </h1>
            <div>
                <label class="btn-upload">${userVO.mbr_pt} 빵</label>
                <input type="button" class="btn-upload" value="추가 적립" onclick="">
            </div>
        </div>
        <br>
        <div class="writeDisplay">
            <div class="left">
                <table>
                    <thead>
                    <tr>
                        <th>아이디 : </th>
                        <th>이름(닉네임) : </th>
                        <th>전화번호 : </th>
                        <th>이메일 : </th>
                        <th>회원 등급 : </th>
                    </tr>
                    </thead>
                    <tbody>
                </table>

            </div>



            <div class="right" style="padding: 30px">
                <!--사진-->
                <div style="width: 200px; height: 200px; background-color: white; margin-right: auto; margin-left: auto"></div>
                <br>
                <input type="text" class="form-control" style="width:200px; text-align: center; margin-right: auto; margin-left: auto; margin-bottom: 10px" id="strName" name="strName" required="required" readonly>
                <input type="button" class="btn-upload" value="매장선택" onclick="openSelect()">
            </div>

            <div class="form-group">
                <label for="brd_cn">내용</label>
                <!--  여러줄의 데이터를 입력하고 하고자 할때 textarea 태그를 사용한다. -->
                <!--  textarea 안에 있는 모든 글자는 그대로 나타난다. 공백문자, tag, enter -->
                <textarea class="form-control" rows="10" id="brd_cn"
                          name="brd_cn" placeholder="내용 작성"></textarea>
            </div>

            <button type="submit" class="btn-upload" style="font-family: 'Nanum Gothic', sans-serif; font-size: 15pt">등록하기</button>

        </div>
    </div>

    <script type="text/javascript">
        /*let openWin;*/
        var openWin;

        function openSelect() {
            // window.name = "부모창 이름";
            window.name = "boardForm";

            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("select", "selectForm", "width=570, height=350, resizable = no, scrollbars = no");
        }
    </script>

</body>
</html>
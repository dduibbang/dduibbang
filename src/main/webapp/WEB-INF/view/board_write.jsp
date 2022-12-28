<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="header/header.jsp"%>
    <link rel="stylesheet" type="text/css" href="css/write.css">
</head>

<body>
    <div class="tab">
        <br>
        <br>
        <div class="writeDisplay">
            <div>
                <label class="safe" for=""><input type="radio" value="N"  name="safeYn" checked /><span>일반거래</span></label>
                <label class="safe" for=""><input type="radio" value="Y"  name="safeYn" /><span>안심거래</span></label>
            </div>
            <div>
                음식종류: <input type="text" id="brdTtl" name="brdTtl">
                <br>
                배송지: <input type="text" id="brdAdr" name="brdAdr">
                <br>
                배달비: <input type="text" id="brdPay" name="brdPay">
                <br>
                주문 시간: <input type="time" id="">
                <br>
                참여자 수:
            </div>
        </div>
        <br>
        <div>
            <button class="btn-upload">등록하기</button>
        </div>
    </div>
</body>
</html>
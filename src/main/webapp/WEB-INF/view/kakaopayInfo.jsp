<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="ko" style="height: 100%;">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!--    <link rel="stylesheet" type="text/css" href="css/home.css">
        <link rel="stylesheet" type="text/css" href="css/tap.css">
        <link rel="stylesheet" type="text/css" href="css/board.css">
        <link rel="stylesheet" type="text/css" href="css/header.css">
        <link rel="stylesheet" type="text/css" href="css/memberInfo.css">-->


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>

<body>
    <div>
        <label style="font-size: 15pt">결제가 완료되었습니다!</label>
        <br>
        <label class="mbr-info" style="font-size: 25pt; margin-top: 160px; margin-bottom: 170px">보유 포인트 : ${userInfo.mbr_pt}</label>
    </div>
    <div>
        <button type="button" class="btn btn-lg btn-block  btn-custom" id="ok" style="background-color: #f8941d; height: 80px;">확 인</button>
    </div>

</body>

<script>
    $('#ok').click(function () {
        opener.parent.location.reload();
        window.close();
    })
</script>
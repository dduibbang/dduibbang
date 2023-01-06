<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="header/header.jsp"%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/home.css">
    <link rel="stylesheet" type="text/css" href="../css/board.css">
    <link rel="stylesheet" type="text/css" href="../css/header.css">
    <link rel="stylesheet" type="text/css" href="../css/tab.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function(){
            console.log(<%= request.getParameter("userInfo")%>);
            getMyAdr();
        });
    </script>
</head>

<body style="background-color: #F7C123;">
<div class="Btap" style="width: 1800px;height: 1100px;margin:auto;background: #f9fcf3;border-radius: 20px;padding: 20px;padding-top: 0px;box-shadow: 5px 5px darkgray">
    tab
    mbr_sn : ${mbr_sn}
</div>
</body>
</html>
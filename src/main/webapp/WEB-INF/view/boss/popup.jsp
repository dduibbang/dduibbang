<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    int sn=(int)session.getAttribute("mbr_sn");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>매장 선택</title>

    <link rel="stylesheet" type="text/css" href="css/board.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<style>
    #btnSubmit{
        width:100px;
        margin:auto;
        display:block;
    }


</style>





<form name="regStore" action="/regStore" method="post" class="uf-form-signin h-75 card mb-3 align-items-center">
        <form class="mt-4 align-items-center">

            <div>
                <input type="hidden" name="mbr_sn" value="<%=sn%>"/>
            </div>


            <div class="input-group  input-group-lg mb-3">
                <input type="text" class="form-control" id="str_nm" name="str_nm"
                       placeholder="매장 이름">
            </div>
            <div class="input-group  input-group-lg mb-3">
                <input type="text" class="form-control" id="str_tel" name="str_tel"
                       placeholder="매장 전화번호">
            </div>

            <div class="input-group  input-group-lg mb-3">
                <input type="text" class="form-control" id="str_bin" name="str_bin"
                       placeholder="사업자번호">
            </div>
            <div class="input-group  input-group-lg mb-3">
                <input type="text" class="form-control" id="str_ctgr" name="str_ctgr"
                       placeholder="매장 카테고리">
            </div>
            <div class="input-group  input-group-lg mb-3">
                <input type="text" class="form-control" id="str_min" name="str_min"
                       placeholder="최소 주문금액">
            </div>
            <div class="input-group  input-group-lg mb-3">
                <input type="text" class="form-control" id="str_adr" name="str_adr"
                       placeholder="매장 주소">
            </div>
            <div>
                <br>
            </div>
            <div class="d-grid mb-4">
                <button onclick="setSubmit()" class="btn uf-btn-primary btn-lg " id = "btnSubmit">가게등록</button>
            </div>
        </form>



</form>




<script>
    function setSubmit(){


        var msg = '등록이 완료되었습니다.';
        alert(msg);
        regStore.submit();

    }



</script>

</body>
</html>

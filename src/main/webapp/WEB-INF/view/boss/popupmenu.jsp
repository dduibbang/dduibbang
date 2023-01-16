<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


<form name="regMenu" action="/menu/${num}/regMenu" method="post" class="uf-form-signin h-75">
    <form class="mt-4">



        <div>
            <input type="hidden" name="str_sn" value="${num}"/>
        </div>

        <div class="input-group  input-group-lg mb-3">
            <input type="text" class="form-control" id="menu_ctgr" name="menu_ctgr"
                   placeholder="메뉴카테고리">
        </div>
        <div class="input-group  input-group-lg mb-3">
            <input type="text" class="form-control" id="menu_nm" name="menu_nm"
                   placeholder="메뉴 이름">
        </div>
        <div class="input-group  input-group-lg mb-3">
            <input type="text" class="form-control" id="menu_cn" name="menu_cn"
                   placeholder="메뉴 설명">
        </div>
        <div class="input-group  input-group-lg mb-3">
            <input type="text" class="form-control" id="menu_pr" name="menu_pr"
                   placeholder="메뉴 가격">
        </div>
        <div class="input-group  input-group-lg mb-3">
            <input type="text" class="form-control" id="menu_op" name="menu_op"
                   placeholder="메뉴 옵션">
        </div>

        <div class="d-grid mb-4">
            <button type = "submit"  class="btn uf-btn-primary btn-lg">메뉴등록</button>
        </div>
    </form>



</form>




<script>
    function setSubmit(){


        var msg = '등록이 완료되었습니다.';
        alert(msg);
        regMenu.submit();

    }



</script>

</body>
</html>

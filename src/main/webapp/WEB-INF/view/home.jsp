<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="header/header.jsp"%>

    <link href="css/nav.css" rel="stylesheet">
    <link href="css/sidebar.css" rel="stylesheet">
    <link href="css/font.css" rel="stylesheet">
</head>

<body>
<div class="left" style="position: absolute; left: 0px; width: 22%; height: 100%; bottom: -353.2px; background:whitesmoke;">
</div>
<div class="right" style="position: absolute; right: 0px; width: 22%; height: 100%; bottom: -353.2px; background: whitesmoke;">
</div>
<div id='navi'>
    <ul>
        <input type="checkbox" id="menuicon">
        <!--
        <label for="menuicon">
            <span></span>
            <span></span>
            <span></span>
        </label>
        -->



<%--        <table>--%>
<%--                <tr>--%>
<%--                        <th>id</th>--%>
<%--                        <th>name</th>--%>

<%--                </tr>--%>
<%--                <c:forEach items="${adminList}" var="adminList">--%>
<%--                        <tr>--%>
<%--                                <td>${adminList.id}</td>--%>
<%--                                <td>${adminList.pw}</td>--%>

<%--                        </tr>--%>
<%--                </c:forEach>--%>
<%--        </table>--%>
<br>
<div align="center" style="position: relative;">
    <form action="/home" method="get">
        <style>
            select {
                width: 80px; /* 원하는 너비설정 */
                height: 30px;
                padding: 1px .1px; /* 여백으로 높이 설정 */
                font-family: inherit;  /* 폰트 상속 */
                background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */
                border: 1px solid #999;
                border-radius: 1px; /* iOS 둥근모서리 제거 */
                -webkit-appearance: none; /* 네이티브 외형 감추기 */
                -moz-appearance: none;
                appearance: none;
            }

            /* IE 10, 11의 네이티브 화살표 숨기기 */
            select::-ms-expand {
                display: none;
            }
        </style>
        <select name="searchType" style="left: 30%; height: auto">
            <option value="">선택</option>
            <option value="t">제목</option>
            <option value="n">글쓴이</option>
            <option value="j">희망직종</option>
        </select>

        <input name="searchKeyword" id="searchKeyword" type="text" placeholder="&nbsp;검색어를 입력하세요">

        <button style="border: 2px; padding: 4px">검색</button>
    </form>
</div>


<%-- ...게시글 리스트 생략....--%>

</body>

<footer>
    <%@include file="header/footer.jsp"%>
</footer>
</html>
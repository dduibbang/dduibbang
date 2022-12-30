<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="header/header.jsp"%>
    <link rel="stylesheet" type="text/css" href="css/tab.css">
    <script>
        $(document).ready(function(){
            console.log(<%= request.getParameter("userInfo")%>);

        });
    </script>
</head>
<body>
<br>
<div class="tab">
    <input  class=input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
    <label for="tab1">일반거래</label>

    <input class=input id="tab2" type="radio" name="tabs">
    <label for="tab2">안심거래</label>

    <button class="str" onclick="location.href='write'">모집 시작하기</button>

    <section class=tabContents id="content1">
        <div align="center" style="position: relative;">

            <%-- 게시물 검색폼--%>
            <form action="/home" method="get">
                <select name="searchType" style="left: 30%; height: auto">
                    <option value="">선택</option>
                    <option value="t">제목</option>
                    <option value="n">글쓴이</option>
                    <option value="j">희망직종</option>
                </select>
                <input name="searchKeyword" id="searchKeyword" type="text" placeholder="&nbsp;검색어를 입력하세요">
                <button style="border: 2px; padding: 4px">검색</button>
            </form>

        </div><p>일반거래의 내용</p>
    </section>

    <section class=tabContents id="content2">
        <p>안심거래의 내용</p>
    </section>
</div>

</body>
</html>
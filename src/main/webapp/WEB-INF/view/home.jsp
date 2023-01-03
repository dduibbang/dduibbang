<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="header/header.jsp"%>
    <link rel="icon" type="image/png" sizes="16x16" href="photo/favicon.png">
    <link rel="stylesheet" type="text/css" href="css/home.css">
    <link rel="stylesheet" type="text/css" href="css/tab.css">
    <link rel="stylesheet" type="text/css" href="css/board.css">
    <script src="../js/home.js"></script>
    <script>
        $(document).ready(function(){
            console.log(<%= request.getParameter("userInfo")%>);
            getMyAdr();
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

    <button class="str" onclick="location.href='board'">모집 시작하기</button>

    <section class=tabContents id="content1">
        <div align="center" style="position: relative;">



                        <!-- 여기부터 board 리스트 표시 -->

                        <div class="table-responsive">
                            <div class="table-wrapper">
                                <div class="table-title">
                                </div>
                                <table class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th>게시판 번호</th>
                                        <th>카테고리</th>
                                        <th>제목</th>
                                        <th>내용</th>
                                        <th>게시상태</th>
                                        <th>모집인원</th>
                                        <th>배달비</th>
                                        <th>배송지</th>
                                        <th>등록자</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="${boardList}" var="u">
                                        <tr>
                                            <td>${u.brd_sn}</td>
                                            <td>${u.brd_ctgr}</td>
                                            <td>${u.brd_ttl}</td>
                                            <td>${u.brd_cn}</td>
                                            <td>${u.brd_st}</td>
                                            <td>${u.brd_nn}</td>
                                            <td>${u.brd_pri}</td>
                                            <td>${u.brd_adr}</td>
                                            <td>${u.rgtr_id}</td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                                <div class="clearfix">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item disabled"><a href="" class="page-link">Previous</a></li>
                                        <li class="page-item active"><a href="" class="page-link">1</a></li>
                                        <li class="page-item"><a href="" class="page-link">2</a></li>
                                        <li class="page-item"><a href="" class="page-link">3</a></li>
                                        <li class="page-item"><a href="" class="page-link">4</a></li>
                                        <li class="page-item"><a href="" class="page-link">5</a></li>
                                        <li class="page-item"><a href="" class="page-link">Next</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

            </section>



        </div>





    </section>

    <section class=tabContents id="content2">
        <p>안심거래의 내용</p>
    </section>
</div>

</body>
</html>
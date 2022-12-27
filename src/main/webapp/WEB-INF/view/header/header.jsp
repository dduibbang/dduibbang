<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String id=(String)session.getAttribute("id");
    String state=(String)session.getAttribute("state");
%>

<div1>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>N BBANG</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/home.css" rel="stylesheet" />
        <link href="css/header.css" rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    </head>
    <body>
    <c:set var="id" value="<%=id%>"></c:set>
    <c:set var="state" value="<%=state%>"></c:set>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">

        <div class="container px-4 px-lg-5">

            <div id="mySidenav" class="sidenav">
                <!-- <a href="javascript:closeNav()" class="closebtn" >&times;</a> -->
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <a href="#">가게 모아보기</a>
                <a href="#">게시글 보기</a>
                <a href="#">그룹 엔빵</a>
                <a href="#">주소 설정</a>
                <a href="#">커뮤니티</a>
                <a href="#">마이페이지</a>
                <a href="#">주문현황</a>
            </div>

            <!-- #main>h2>lorem3^p>lorem20^span -->
            <div id="main">

                <span style="cursor: pointer; font-size: 30px" onclick="openNav();">&#9776;</span>
            </div>

            <script>
                function openNav(){
                    //sidenav 클래스를 가진 div 요소 : width:0 숨기기
                    document.getElementById("mySidenav").style.width="250px";
                    //css margin-left : 250px -> js로 고칠때는 marginLeft (-나오면 무조건 지우고 대문자)
                    document.getElementById("main").style.marginLeft="250px";
                    document.body.style.backgroundColor="rgba(0,0,0,0.4)";
                }
                function closeNav(){
                    //sidenav 클래스를 가진 div 요소 : width:0 숨기기
                    document.getElementById("mySidenav").style.width="0px";
                    document.getElementById("main").style.marginLeft="0px";
                    document.body.style.backgroundColor="white";
                }
            </script>


            <a class="navbar-brand" href="/home">N BBANG</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <c:if test="${state != null}">
                        <li class="nav-item"><a class="nav-link" href="#!"><%=id%>님</a></li>
                    </c:if>
                    <c:if test="${state eq 'user'}">
                        <li class="nav-item"><a class="nav-link" href="/myinfo">마이페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="/mylist">이력서</a></li>
                    </c:if>
                </ul>
                <form class="d-flex">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">

                        <c:if test="${state != null}">
                            <li class="nav-item"><a class="nav-link active" aria-current="page" href="/logout">logout</a></li>
                        </c:if>
                        <c:if test="${state eq null}">
                            <li class="nav-item"><a class="nav-link active" aria-current="page" href="/login">login</a></li>
                        </c:if>
                    </ul>
                </form>
            </div>
        </div>

    </nav>
    </body>
</div1>



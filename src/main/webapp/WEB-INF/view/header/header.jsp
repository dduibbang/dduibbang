<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String id=(String)session.getAttribute("id");
    String state=(String)session.getAttribute("state");
%>

<div1>
    <head>
<%--        <%@import url'https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap'%>--%>

        <title>N BBANG</title>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/home.css" rel="stylesheet" />
        <link href="css/header.css" rel="stylesheet"/>

        <!-- font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    </head>
    <body>
    <c:set var="id" value="<%=id%>"></c:set>
    <c:set var="state" value="<%=state%>"></c:set>
    <header>
        <div style="display: flex;position: sticky">
        <div id="main">
            <span style="cursor: pointer; font-size: 30px" onclick="openNav();">&#9776;</span>
        </div>
        <h1 style="font-family: 'Fredoka One', cursive;"><a href="/home">N BBANG</a></h1></div>
        <div>
            <ul>
                <c:if test="${state != null}">
                    <li class="nav-item"><a class="nav-link" href="#!"><%=id%>님</a></li>
                </c:if>
                <c:if test="${state eq 'user'}">
                    <li class="nav-item"><a class="nav-link" href="/myinfo">마이페이지</a></li>
                </c:if>
            </ul>
        </div>
        <nav>
            <form class="formBtn">
                <ul>

                    <c:if test="${state != null}">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/logout">logout</a></li>
                    </c:if>
                    <c:if test="${state eq null}">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/login">login</a></li>
                    </c:if>
                </ul>
            </form>
        </nav>
    </header>
    <nav id="navHeader">
        <div  style="display: flex">
            <div id="mySidenav" class="sidenav" style="font-family: 'Nanum Gothic', sans-serif;">
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
        </div>
    </nav>
    </body>
</div1>



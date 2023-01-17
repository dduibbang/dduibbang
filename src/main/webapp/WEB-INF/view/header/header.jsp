<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div1>
    <head>
        <%--        <%@import url'https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap'%>--%>

        <title>🍩N BBANG</title>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/home.css" rel="stylesheet" />
        <link href="css/header.css" rel="stylesheet"/>

        <!-- font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="/css/font.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>



    </head>
    <body>
    <header>
        <div style="display: flex;position: sticky">
            <div id="main">
                <span style="cursor: pointer; font-size: 30px" onclick="openNav();">&#9776;</span>
            </div>
            <h1 style="font-family: 'Fredoka One', cursive;"><a class="nav-link" href="/home">N BBANG</a></h1></div>
        <div style="display: flex; align-items: baseline;" >
            <div style="margin-right: 20px;">
                    <ul>
                        <c:if test="${mbr_sn != null}">
                            <li class="nav-item"><a class="nav-link" href="#">${userInfo.mbr_nm}님</a></li>
                            <li class="nav-item"><a class="nav-link">${userInfo.mbr_pt} 빵</a></li>
                            <li class="nav-item"><a class="nav-link" href="/memberInfo">마이페이지</a></li>
                        </c:if>
                    </ul>
            </div>
            <div>
                <form class="formBtn">
                    <ul>
                        <c:if test="${mbr_sn != null}">
                            <li class="nav-item"><a class="nav-link active" aria-current="page" href="/logout">logout</a></li>
                        </c:if>
                        <c:if test="${mbr_sn eq null}">
                            <li class="nav-item"><a class="nav-link active" aria-current="page" href="/login">login</a></li>
                        </c:if>
                    </ul>
                </form>
            </div>
        </div>
    </header>
    <nav id="navHeader">
        <div  style="display: flex">
            <div id="mySidenav" class="sidenav" style="font-family: 'Nanum Gothic', sans-serif;">
                <!-- <a href="javascript:closeNav()" class="closebtn" >&times;</a> -->
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()" style="margin-bottom: 100px">&times;</a>
                <c:if test="${userInfo.mbr_se eq '01'}">
                    <a href="/bosslogin" style="font-family: 'TmoneyRoundWindExtraBold';">가게 관리하기</a>
                </c:if>
                <a href="/storePage" style="font-family: 'TmoneyRoundWindExtraBold';">가게 모아보기</a>
                <a href="/home" style="font-family: 'TmoneyRoundWindExtraBold';">게시글 보기</a>
                <a href="#" style="font-family: 'TmoneyRoundWindExtraBold';">그룹 엔빵</a>
                <a href="/map" style="font-family: 'TmoneyRoundWindExtraBold';">주소 설정</a>
                <a href="#" style="font-family: 'TmoneyRoundWindExtraBold';">커뮤니티</a>
                <a href="/memberInfo" style="font-family: 'TmoneyRoundWindExtraBold';">마이페이지</a>
                <a href="/orderList" style="font-family: 'TmoneyRoundWindExtraBold';">주문현황</a>
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
                    document.body.style.backgroundColor="#f7c123";
                }
            </script>
        </div>
    </nav>
    </body>
</div1>



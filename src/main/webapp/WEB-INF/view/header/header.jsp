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
        <title>Sell me</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/home.css" rel="stylesheet" />
    </head>
    <body>
    <c:set var="id" value="<%=id%>"></c:set>
    <c:set var="state" value="<%=state%>"></c:set>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="/home">Sell me</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link" href="/home" >Home</a></li>
                    <c:if test="${state != null}">
                        <li class="nav-item"><a class="nav-link" href="#!"><%=id%>님</a></li>
                    </c:if>
                    <c:if test="${state eq 'user'}">
                        <li class="nav-item"><a class="nav-link" href="/myinfo">마이페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="/mylist">이력서</a></li>
                    </c:if>
                    <c:if test="${state eq 'company'}">
                        <li class="nav-item"><a class="nav-link" href="/cominfo">마이페이지</a></li>
                    </c:if>
                </ul>
                <form class="d-flex">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">

                        <c:if test="${state != null}">
                            <li class="nav-item"><a class="nav-link active" aria-current="page" href="/logout">로그아웃</a></li>
                        </c:if>
                        <c:if test="${state eq null}">
                            <li class="nav-item"><a class="nav-link active" aria-current="page" href="/login">개인로그인</a></li>
                            <li class="nav-item"><a class="nav-link active" aria-current="page" href="/loginhr">기업로그인</a></li>
                        </c:if>
                    </ul>
                </form>
            </div>
        </div>
    </nav>

    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">Sell me</h1>
                <p class="lead fw-normal text-white-50 mb-0">나를 사가시오!</p>
            </div>
        </div>
    </header>
    </body>
</div1>



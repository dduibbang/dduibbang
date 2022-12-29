<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>주소 설정</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=35o7z9sq66&submodules=geocoder"></script>
    <link rel="stylesheet" type="text/css" href="../../docs/css/examples-base.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <link rel="stylesheet" type="text/css" href="../css/map.css?ver1" />
    <link rel="stylesheet" type="text/css" href="/css/font.css">
    <script src="../js/map.js?ver0"></script>
</head>

<body>
<div style="display: flex">
    <nav id="sub-bar" style="order: 1">
        <div class="basicBtn" style="font-size: small"><a href="home.jsp">홈 화면으로</a></div>
        <h1>위치 설정</h1>
        <br>
        <div >
            <form class="LeftForm" id="send"  method="GET">

                <p>도로명 주소 :</p>
                <p><input class="input-box" type="String" name="street-location" id="street-location" value=""></p>
                <p>상세 주소 :</p>
                <p><input class="input-box" type="String" name="detail-location" id="detail-location" value=" 상세주소를 입력해주세요."></p>
                <div style="display: flex">
                <input class="basicBtn" style="width: -webkit-fill-available;text-align: center;" action="saveLocation" type="submit" value="이 위치로 주소 설정">
                    <input class="basicBtn" style="width: -webkit-fill-available;text-align: center;" action="sendLocation" type="submit" value="즐겨찾기 추가">
                </div>
            </form>
            <div style="background-color: #FFFFFF; margin: 20px;margin-top: 50px;margin-bottom: 40px"></div>

            <h1 style="margin-top: 50px;" >즐겨찾기</h1>
            <form class="LeftForm" id="storyForm" action="" method="GET" style="overflow: auto">
<%--                <c:forEach items="${postlist}" var="p">--%>
<%--                    <ol class="story-ul">--%>
<%--                        <label class="story-label">${p.txt_nm}</label>--%>
<%--                        <div class="story-div">내용: ${p.txt_cn}</div>--%>
<%--                            &lt;%&ndash;                        <div>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                            <a href="/postList">상세 보기</a>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--                    </ol>--%>
<%--                </c:forEach>--%>
            </form>
        </div>

    </nav>
    <div class="section" style="order: 2">
        <div id="map"></div>
        <code id="snippet" class="snippet"></code>
    </div>

</div>
</body>
</html>




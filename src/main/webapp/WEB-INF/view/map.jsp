<%@ page import="lombok.var" %>
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

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <link rel="stylesheet" type="text/css" href="../css/map.css?ver1" />
    <link rel="stylesheet" type="text/css" href="/css/font.css">
    <script src="../js/map.js?ver1"></script>

</head>
<body>
<div style="display: flex">
<%--    <input type="hidden" id="contextPath" value="<%=request.getContextPath()%>">--%>
    <nav id="sub-bar" style="order: 1">
        <div class="basicBtn" style="font-size: 30px;margin: 0px;padding: 0px" ><a href="/home">🏠</a></div>
        <h1 style="margin-top:0px">위치 설정</h1>
        <br>
        <div >
            <form class="LeftForm" action="setAddress"  method="POST">
                <p><input type="hidden" name="mbr_sn"   value="${sn}"></p>
                <p><input type="hidden" name="adr_lat"  id="latiVal_"  value=""></p>
                <p><input type="hidden" name="adr_lon"  id="longiVal_"  value=""></p>

                <p>도로명 주소 :</p>
                <p><input class="input-box" type="String" name="adr_cn" id="adr_cn_open" value=""></p>
                <p>상세 주소 :</p>
                <p><input class="input-box" type="String" name="adr_st" id="adr_st_open" value="상세주소를 입력해주세요."></p>
                <div style="display: flex">
                <input class="basicBtn" style="width: -webkit-fill-available;text-align: center;" type="submit" value="이 위치로 주소 설정">
                </div>
            </form>
            <div style="background-color: #FFFFFF; margin: 20px;margin-top: 50px;margin-bottom: 40px"></div>

            <h1 style="margin-top: 50px;" >🔍즐겨찾기</h1>
            <form class="LeftForm" action="insertMap" method="post">
                <p>즐겨찾기 이름 :</p>
                <div style="display: flex">
                    <p><input type="hidden" name="mbr_sn"  value="${sn}"></p>
                    <p><input type="hidden" name="adr_lat"  id="latiVal"  value=""></p>
                    <p><input type="hidden" name="adr_lon"  id="longiVal"  value=""></p>
                    <p><input type="hidden" name="adr_cn"  id="adr_cn_close"  value=""></p>
                    <p><input type="hidden" name="adr_st"  id="adr_st_close" value=""></p>
                    <p><input class="input-box" type="String" name="adr_ttl" id="adr_ttl" value="" onkeyup="printAdrSt()"></p>
                    <input class="basicBtn" style="width: -webkit-fill-available;text-align: center;" type="submit" value="즐겨찾기 추가">
                </div>
                <div style="overflow: auto;height: 610px;margin-top: 20px">
                    <form action="setAddressBtn" method="post" style="overflow: auto">
                        <c:forEach items="${likeAdrList}" var="likeAdrlist">
                            <ul id="like-address-list" style="padding-top: 1px;" >
                                <div id="like-address" style="overflow-wrap: normal">
                                    <li>
                                        <h3><input type="String" name="adr_ttl" value="🔸${likeAdrlist.adr_ttl}"></h3>
                                        <div class="story-div"> ${likeAdrlist.adr_cn} ${likeAdrlist.adr_st}</div>
                                        <input class="basicBtn" style="margin-top: 10px;width: -webkit-fill-available;text-align: center;" type="submit" value="기본주소 설정">
                                    </li>
                                </div>
                            </ul>
                        </c:forEach>
                    </form>
<%--                    <c:forEach items="${likeAdrList}" var="likeAdrlist">--%>
<%--                        &lt;%&ndash;                    <p><input type="hidden" name="adr_ttl"   value="${sn}"></p>&ndash;%&gt;--%>
<%--                        <ul id="like-address-list" style="padding-top: 1px;" >--%>
<%--                            <div id="like-address" style="overflow-wrap: normal">--%>
<%--                                <li>--%>
<%--                                    <h3>🔸${likeAdrlist.adr_ttl}</h3>--%>
<%--                                    <div class="story-div"> ${likeAdrlist.adr_cn} ${likeAdrlist.adr_st}</div>--%>
<%--                                    <button class="basicBtn" style="margin-top: 10px">기본주소 설정</button>--%>
<%--                                </li>--%>
<%--                            </div>--%>
<%--                        </ul>--%>
<%--                    </c:forEach>--%>
                </div>
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




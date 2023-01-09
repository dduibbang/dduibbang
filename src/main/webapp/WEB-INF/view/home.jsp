<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="header/header.jsp"%>
    <link rel="icon" type="image/png" sizes="16x16" href="photo/favicon.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/home.css">
    <link rel="stylesheet" type="text/css" href="css/tab.css">
    <link rel="stylesheet" type="text/css" href="css/board.css">
    <link rel="stylesheet" type="text/css" href="css/header.css">
    <link rel="stylesheet" type="text/css" href="css/font.css">
    <link rel="stylesheet" type="text/css" href="../../docs/css/examples-base.css" />

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=35o7z9sq66&submodules=geocoder"></script>
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
    <div style="display: flex;justify-content: center;margin-bottom: 20px">
    <div id="adrBar">
        <div id="adr" style="font-family: 'TmoneyRoundWindExtraBold';"></div>
        <a href="/map" class="basicBtn"> 주소 변경 </a>
    </div>
    </div>

    <input  class=input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
    <label for="tab1">안심거래</label>

    <input class=input id="tab2" type="radio" name="tabs">
    <label for="tab2">일반거래</label>

    <button class="str" onclick="location.href='board'">모집 시작하기</button>


    <section class=tabContents id="content1" style="padding-top: 50px;">
            <!-- 여기부터 board 리스트 표시 -->

        <div class = "searchForm">
            <select  style="height: 40px" name="searchCnd" id="searchYCnd" style="margin-left: 5px;margin-right: 10px">
                <option value="0">전체</option>
                <option value="1">게시 상태</option>
                <option value="2">음식 종류</option>
                <option value="3">가게명</option>
                <option value="4">주소</option>
            </select>
            <div style="display: flex;">
                <input type="text" id="searchYWrd" name="searchWrd" placeholder="검색어를 입력하세요." style="width: 300px;height: 40px;">
                <button class="basicBtn" style="width: 80px; height: 40px;border-radius: 4px;" onclick="search()">검색</button>
            </div>
        </div>

        <div class="table-responsive" style="height: 850px;display: flex;justify-content: center;flex-wrap: wrap;
}">

                        <c:forEach items="${YboardList}" var="brd" varStatus="idx">
                            <div style="width: 1650px;cursor:pointer;" onclick="location.href='/board/${brd.brd_sn}'">
                                <div class = "mainCnt" style="background: #fef1c6;border-bottom: 20px solid #f9fcf3;">
                                    <div style="display: grid;padding: 30px;padding-bottom: 20px;grid-template-columns: 300px 1fr;">
                                        <div id="img_div" style="margin-right: 50px;margin-left: 10px;">
                                            <img src="${selectVOYList[idx.index].str_img}" style="width: 250px;" onerror="this.src='https://post-phinf.pstatic.net/MjAyMDA0MjlfNjIg/MDAxNTg4MTQxNjU3NzQz.ZDWTjIfuekjZLxo3CHMoKl6D5yyhJaeiMo0Cb_x_JRcg.Pj0UivY3zH6VL1Z_tg9brZxQ78_kwJez5KH_IBt3gdAg.PNG/%EC%9D%8C%EC%8B%9D_%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8_%EB%8F%84%EB%84%9B_%EA%B7%B8%EB%A6%BC%EA%B7%B8%EB%A6%AC%EA%B8%B0.png?type=w1200';"/>
                                        </div>
                                        <div  style="display: grid; grid-template-rows: 0.2fr 0.1fr 1fr 0.1fr;">
                                            <div style="display: flex;justify-content: space-between;align-items: stretch;">
                                                <div style="display: flex;justify-content: space-between;align-items: baseline;">
                                                    <h3 style="font-weight:bold;margin-top: 0px;margin-bottom: 30px;margin-right: 10px;">${brd.brd_ttl}</h3>
                                                    <c:if test="${brd.brd_st eq '01'}">
                                                        <div class="basicBtn" style="background: #b5e2ef">모집 중❗</div>
                                                    </c:if>
                                                    <c:if test="${brd.brd_st != '01'}">
                                                        <div class="basicBtn" style="background: #b5e2ef">모집 완료</div>
                                                    </c:if>
                                                    <div class="basicBtn" style="background: #b5e2ef">${brd.brd_ctgr}</div>
                                                    <div class="basicBtn" style="background: #b5e2ef">${selectVOYList[idx.index].str_nm}</div>
                                                </div>
                                                <h3 class="basicBtn" style="margin-top: inherit;">${brd.brd_pri}</h3>
                                            </div>

                                            <div style="margin-top: 10px;margin-bottom: 10px;">${brd.rgtr_id}</div>
                                            <div style="padding: 20px;background: #f9fcf3;margin: 10px;margin-left: 0px;margin-right: 0px">${brd.brd_cn}</div>

                                            <div style="display: flex;justify-content: space-between;align-items: baseline;">
                                                <div class="basicBtn" style="background: #b5e2ef">${brd.brd_adr}</div>
                                                <div style="display: flex;align-items: baseline;">
                                                    <div class="basicBtn" style="font-size: 20px;">${brd.brd_end_dt}</div>
                                                    <div class="basicBtn" style="font-size: 20px;">1/${brd.brd_nn}명</div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
            </div>
        <br>
        <br>
                    <div class="clearfix" style="display: flex;justify-content: center;">
                        <ul class="pagination justify-content-center" style="margin-left: 120px;">
                            <li class="page-item disabled"><a href="" class="page-link">Previous</a></li>
                            <li class="page-item active"><a href="" class="page-link">1</a></li>
                            <li class="page-item"><a href="" class="page-link">2</a></li>
                            <li class="page-item"><a href="" class="page-link">3</a></li>
                            <li class="page-item"><a href="" class="page-link">4</a></li>
                            <li class="page-item"><a href="" class="page-link">5</a></li>
                            <li class="page-item"><a href="" class="page-link">Next</a></li>
                        </ul>
                    </div>

    </section>



    <section class=tabContents id="content2" style="padding-top: 50px;">
        <!-- 여기부터 board 리스트 표시 -->
        <div class = "searchForm">
            <select  style="height: 40px" name="searchCnd" id="searchNCnd" style="margin-left: 5px;margin-right: 10px">
                <option value="0">전체</option>
                <option value="1">제목</option>
                <option value="2">내용</option>
            </select>
            <div style="display: flex;">
                <input type="text" id="searchWrd" name="searchNWrd" placeholder="검색어를 입력하세요." style="width: 300px;height: 40px;">
                <button class="basicBtn" style="width: 80px; height: 40px;border-radius: 4px;" onclick="search()">검색</button>
            </div>
        </div>
        <div class="table-responsive" style="height: 850px;display: flex;justify-content: center;flex-wrap: wrap;
}">

            <c:forEach items="${NboardList}" var="brd" varStatus="idx">
                <div style="width: 1650px;cursor:pointer;" onclick="location.href='/board/${brd.brd_sn}'">
                    <div class = "mainCnt"style="background: #fef1c6;border-bottom: 20px solid #f9fcf3;">
                        <div style="display: grid;padding: 30px;padding-bottom: 20px;grid-template-columns: 300px 1fr;">
                            <div id="img_div2" style="margin-right: 50px;margin-left: 10px;">
                                <img src="${selectVONList[idx.index].str_img}" style="width: 250px;" onerror="this.src='https://post-phinf.pstatic.net/MjAyMDA0MjlfNjIg/MDAxNTg4MTQxNjU3NzQz.ZDWTjIfuekjZLxo3CHMoKl6D5yyhJaeiMo0Cb_x_JRcg.Pj0UivY3zH6VL1Z_tg9brZxQ78_kwJez5KH_IBt3gdAg.PNG/%EC%9D%8C%EC%8B%9D_%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8_%EB%8F%84%EB%84%9B_%EA%B7%B8%EB%A6%BC%EA%B7%B8%EB%A6%AC%EA%B8%B0.png?type=w1200';"/>
                            </div>
                            <div  style="display: grid; grid-template-rows: 0.2fr 0.1fr 1fr 0.1fr;">

                                <div style="display: flex;justify-content: space-between;align-items: stretch;">
                                    <div style="display: flex;justify-content: space-between;align-items: baseline;">
                                        <h3 style="font-weight:bold;margin-top: 0px;margin-bottom: 30px;">${brd.brd_ttl}</h3>
                                        <c:if test="${brd.brd_st eq '01'}">
                                            <div class="basicBtn" style="background: #b5e2ef">모집 중❗</div>
                                        </c:if>
                                        <c:if test="${brd.brd_st != '01'}">
                                            <div class="basicBtn" style="background: #b5e2ef">모집 완료</div>
                                        </c:if>
                                        <div class="basicBtn" style="background: #b5e2ef">${brd.brd_ctgr}</div>
                                        <div class="basicBtn" style="background: #b5e2ef">${selectVONList[idx.index].str_nm}</div>
                                    </div>
                                    <h3 class="basicBtn" style="margin-top: inherit;">${brd.brd_pri}</h3>
                                </div>

                                <div style="margin-top: 10px;margin-bottom: 10px;">${brd.rgtr_id}</div>
                                <div style="padding: 20px;background: #f9fcf3;margin: 10px;margin-left: 0px;margin-right: 0px">${brd.brd_cn}</div>

                                <div style="display: flex;justify-content: space-between;align-items: baseline;">
                                    <div class="basicBtn" style="background: #b5e2ef">${brd.brd_adr}</div>
                                    <div style="display: flex;align-items: baseline;">
                                        <div class="basicBtn" style="font-size: 20px;">${brd.brd_end_dt}</div>
                                        <div class="basicBtn" style="font-size: 20px;">1/${brd.brd_nn}명</div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <br>
        <br>
        <div class="clearfix" style="display: flex;justify-content: center;">
            <ul class="pagination justify-content-center" style="margin-left: 120px;">
                <li class="page-item disabled"><a href="" class="page-link">Previous</a></li>
                <li class="page-item active"><a href="" class="page-link">1</a></li>
                <li class="page-item"><a href="" class="page-link">2</a></li>
                <li class="page-item"><a href="" class="page-link">3</a></li>
                <li class="page-item"><a href="" class="page-link">4</a></li>
                <li class="page-item"><a href="" class="page-link">5</a></li>
                <li class="page-item"><a href="" class="page-link">Next</a></li>
            </ul>
        </div>

    </section>
</div>

</body>
</html>
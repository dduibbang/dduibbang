<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <link rel="icon" type="image/png" sizes="96x96" href="photo/topnew.png">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign Up</title>


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style>
        body{
            transition :0.5s;
        }


        .sidenav{
            height: 100%;
            position: fixed;
            left:0;
            top:0;
            z-index:1;
            background: #111;
            padding-top: 60px;
            overflow-x: hidden;


            width: 0;

            transition :0.5s;
        }
        .sidenav a{
            color: #818181;
            text-decoration: none;
            font-size: 25px;
            display: block;
            padding: 8px 8px 8px 32px;

            transition :0.3s;
        }
        .sidenav a:hover{
            color: #f1f1f1;
        }

        div#main{
            padding: 16px;
            transition :0.5s;
        }


    </style>



</head>
<body>



    <div id="mySidenav" class="sidenav">
        <!-- <a href="javascript:closeNav()" class="closebtn" >&times;</a> -->
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="#">About</a>
        <a href="#">Services</a>
        <a href="#">Clients</a>
        <a href="#">Contact</a>
    </div>
    <!-- #main>h2>lorem3^p>lorem20^span -->
    <div id="main">
        <h2>사이드바 테스트</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem rem cupiditate distinctio adipisci quam quasi culpa doloribus error ad sit.</p>
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








<form action="/signup" method="post">



    <section class="background-radial-gradient overflow-hidden">
        <style>
            .background-radial-gradient {
                background-color: hsl(218, 41%, 15%);
                background-image: radial-gradient(650px circle at 0% 0%,
                hsl(218, 41%, 35%) 15%,
                hsl(218, 41%, 30%) 35%,
                hsl(218, 41%, 20%) 75%,
                hsl(218, 41%, 19%) 80%,
                transparent 100%),
                radial-gradient(1250px circle at 100% 100%,
                        hsl(218, 41%, 45%) 15%,
                        hsl(218, 41%, 30%) 35%,
                        hsl(218, 41%, 20%) 75%,
                        hsl(218, 41%, 19%) 80%,
                        transparent 100%);
            }

            #radius-shape-1 {
                height: 220px;
                width: 220px;
                top: -60px;
                left: -130px;
                background: radial-gradient(#44006b, #ad1fff);
                overflow: hidden;
            }

            #radius-shape-2 {
                border-radius: 38% 62% 63% 37% / 70% 33% 67% 30%;
                bottom: -60px;
                right: -110px;
                width: 300px;
                height: 300px;
                background: radial-gradient(#44006b, #ad1fff);
                overflow: hidden;
            }

            .bg-glass {
                background-color: hsla(0, 0%, 100%, 0.9) !important;
                backdrop-filter: saturate(200%) blur(25px);
            }
        </style>

        <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
            <div class="row gx-lg-5 align-items-center mb-5">
                <div class="col-lg-6 mb-5 mb-lg-0" style="z-index: 10">
                    <h1 class="my-5 display-5 fw-bold ls-tight" style="color: hsl(218, 81%, 95%)">
                        인재들과 함께하세요 <br />
                        <span style="color: hsl(218, 81%, 75%)">지금 Sell Me로 가입하세요</span>
                    </h1>
                    <p class="mb-4 opacity-70" style="color: hsl(218, 81%, 85%)">
                        우리를 지금 데려가라, 그렇지않다면, 너의 미래는..
                    </p>
                </div>

                <div class="col-lg-6 mb-5 mb-lg-0 position-relative">
                    <div id="radius-shape-1" class="position-absolute rounded-circle shadow-5-strong"></div>
                    <div id="radius-shape-2" class="position-absolute shadow-5-strong"></div>

                    <div class="card bg-glass">
                        <div class="card-body px-4 py-5 px-md-5">
                            <form>
                                <!-- 2 column grid layout with text inputs for the first and last names -->
                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <label class="form-label" for="userId">아이디</label>
                                            <input type="text" id="userId" name="userId" placeholder="id" required class="form-control" />
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <label class="form-label" for="userName">이름</label>
                                            <input type="text" id="userName" name="userName" placeholder="name" required  class="form-control" />
                                        </div>
                                    </div>
                                </div>




                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <label class="form-label" for="userPw">비밀번호</label>
                                            <input type="password" id="userPw" name="userPw" placeholder="pw"required class="form-control" />

                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <label class="form-label" for="userPurpose">비밀번호 확인</label>
                                            <input type="password" id="user123" name="user123" placeholder="p123" required class="form-control" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <label class="form-label" for="userBirth">생년월일</label>
                                            <input type="date" id="userBirth" name="userBirth" placeholder="birthday" required  class="form-control" />


                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <label class="form-label" for="userEmail">Email</label>
                                            <input type="text" id="userEmail"  name="userEmail" placeholder="email" required  class="form-control" />

                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <label class="form-label" for="userPhNum">핸드폰 번호</label>
                                            <input type="text" id="userPhNum" name="userPhNum" placeholder="phone number" required  class="form-control" />

                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <label class="form-label" for="userPurpose">가입 목적</label>
                                            <input type="text" id="userPurpose" name="userPurpose" placeholder="purpose" required class="form-control" />

                                        </div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <label class="form-label">주소</label>
                                            <input class="form-control" type="text" id="sample6_postcode" placeholder="우편번호">
                                            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary btn-block mb-4 display-center" style="margin-bottom: -20px !important;"><br>
                                            <input class="form-control"type="text" id="sample6_address" name="userAddress" placeholder="주소" style="margin-top: 25px !important;"><br>
                                            <input class="form-control"type="text" id="sample6_detailAddress" placeholder="상세주소" style="margin-bottom: 5px; margin-top: -20px">
                                            <input class="form-control"type="text" id="sample6_extraAddress" placeholder="참고항목" >
                                            <input type="hidden" id="sample6_city" name="userCity" placeholder="도시">

                                        </div>
                                    </div>

                                </div>


                                <%--                                <div class="row">--%>
                                <%--                                    <div class="col-md-6 mb-4">--%>
                                <%--                                        <div class="form-outline">--%>



                                <%--                                        </div>--%>
                                <%--                                    </div>--%>

                                <%--                                </div>--%>




                                <!-- Password input -->
                                <div class="form-outline mb-4">
                                    <label class="form-label" for="userGender">성별 : </label>


                                    <input class="form-check-input" type="radio" id = "userGender" name="userGender" value="남" checked>
                                    <label class="form-check-label" for="userGender">
                                        남자&nbsp;
                                    </label>


                                    <input class="form-check-input" type="radio" name="userGender" value="여">여자

                                </div>

                                <!-- Submit button -->
                                <button type="submit" class="btn btn-primary btn-block mb-4 display-center" >
                                    가입완료
                                </button>


                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</form>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
<footer>
    <%@include file="header/footer.jsp"%>
</footer>
</html>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                var add = addr.split(" ");
                var city=add[0];
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_city").value = city;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
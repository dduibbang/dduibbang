<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%--<script>--%>
<%--    $(document).ready(function(){--%>
<%--        $("#btnLogin").click(function(){--%>
<%--            // 태크.val() : 태그에 입력된 값--%>
<%--            // 태크.val("값") : 태그의 값을 변경--%>
<%--            var userId = $("#userId").val();--%>
<%--            var userPw = $("#userPw").val();--%>
<%--            if(userId == ""){--%>
<%--                alert("아이디를 입력하세요.");--%>
<%--                $("#userId").focus(); // 입력포커스 이동--%>
<%--                return; // 함수 종료--%>
<%--            }--%>
<%--            if(userPw == ""){--%>
<%--                alert("아이디를 입력하세요.");--%>
<%--                $("#userPw").focus();--%>
<%--                return;--%>
<%--            }--%>
<%--            // 폼 내부의 데이터를 전송할 주소--%>
<%--            document.form1.action="${path}/member/loginCheck.do"--%>
<%--            // 제출--%>
<%--            document.form1.submit();--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
</head>
<body>
<form action="/login" method="post">
    <section class=" text-center text-lg-start">

        <style>
            .rounded-t-5 {
                border-top-left-radius: 0.5rem;
                border-top-right-radius: 0.5rem;
            }

            @media (min-width: 992px) {
                .rounded-tr-lg-0 {
                    border-top-right-radius: 0;
                }

                .rounded-bl-lg-5 {
                    border-bottom-left-radius: 0.5rem;
                }
            }
        </style>
        <div class="card mb-3 align-items-center">
            <div class="col-lg-5 align-items-center">
                <div class="card-body py-5 px-md-5">
                    <h2 class="nanum" style="font-size:1.5em; text-align: center">개인로그인</h2>
                    <br>
                    <br>
                    <form>
                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <label class="form-label" for="mbr_id">Id</label>
                            <input type="text" id="mbr_id" name = "mbr_id" class="form-control" placeholder="Id" />
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-4">
                            <label class="form-label" for="mbr_pwd">Password</label>
                            <input type="password" id="mbr_pwd" name = "mbr_pwd" class="form-control" placeholder="password" />
                        </div>

                        <!-- 2 column grid layout for inline styling -->
                        <div class="row mb-4">
                            <div class="col d-flex ">
                                <!-- Checkbox -->
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="form2Example31" unchecked />
                                    <label class="form-check-label" for="form2Example31"> 아이디 저장 </label>
                                </div>
                            </div>

                        </div>

                        <!-- Submit button -->
                        <button type="submit" class="btn btn-primary btn-block mb-4">로그인</button>
                        <button type="button" class="btn btn-primary btn-block mb-4" onclick="location.href='signup'">회원가입</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
</form>
</body>
<footer>
    <%@include file="header/footer.jsp"%>
</footer>
</html>
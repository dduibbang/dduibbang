<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
    <%@include file="header/header.jsp"%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <link rel="stylesheet" href="css/login.css">

</head>
<body>
<form action="/login" method="post">


    <div class="container">
        <div class="d-flex justify-content-center h-70">
            <div class="card">
                <div class="card-header">
                    <h3>Sign In</h3>
                </div>
                <div class="card-body ">
                    <form>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" name="mbr_id" id="mbr_id" class="form-control" placeholder="Id">

                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" name="mbr_pwd" id="mbr_pwd" class="form-control" placeholder="password">
                        </div>
                        <div class="row align-items-center remember">
                            <input type="checkbox">Remember Me
                        </div>
                        <div class="form-group">
                            <input type="submit" value="Login" class="btn float-right login_btn">
                        </div>
                    </form>
                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-center links">
                        Don't have an account?<a href="signup">Sign Up</a>
                    </div>
                    <div class="d-flex justify-content-center">
                        <a href="#">Forgot your password?</a>
                    </div>
                </div>
            </div>
        </div>
    </div>






</div>
</form>


</body>
<footer>
    <%@include file="header/footer.jsp"%>
</footer>
</html>
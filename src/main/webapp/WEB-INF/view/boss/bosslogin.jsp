<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" sizes="96x96" href="photo/topnew.png">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <link href="css/signin.css" rel="stylesheet" />
    <title>Login</title>
</head>
<body>
    <form action="/bosslogin" method="post" class="uf-form-signin h-75">
    <div class="text-center ">
        <img src="photo/logo.png" alt="" width="300" height="300"></a>

    </div>
    <form class="mt-4">
        <div class="input-group  input-group-lg mb-3">
            <input type="text" class="form-control" id="boss_id" name="boss_id"
                   placeholder="아이디">
        </div>
        <div class="input-group  input-group-lg mb-3">
            <input type="password" class="form-control" id="boss_pw" name="boss_pw"
                   placeholder="비밀번호">
        </div>
        <div class="d-flex mb-3 justify-content-between">
            <div class="form-check">

            </div>
        </div>
        <div class="d-grid mb-4">
            <button type="submit" id="loginBtn"
                    class="btn uf-btn-primary btn-lg">로그인</button>
        </div>



    </form>
    </form>
    <!-- Separate Popper and Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>

</body>
</html>
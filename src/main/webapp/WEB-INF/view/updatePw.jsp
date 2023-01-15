<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>비밀번호 변경</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/board.css">
    <link rel="stylesheet" type="text/css" href="css/memberInfo.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="table-responsive">
    <form action="/updatePw" method="post" id="updatePw" name="updatePw">
        <div class="table-wrapper" style="padding-top: 20px">
            <div class="table-title">
                <input type="hidden" name="mbr_pwd" id="mbr_pwd" value="${userInfo.mbr_pwd}">
            </div>
            <div class="left-info" style="padding-left: 10%">
                <label>현재 비밀번호 : </label>
                <br>
                <label style="line-height: 3;">비밀번호 : </label>
                <br>
                <label>비밀번호 확인 : </label>
            </div>

            <div class="right-info" style="margin-bottom: 45px">
                <input type="password" id="pw" name="pw" class="form-control" maxlength="30" style="width: 200px; line-height: 3;">
                <input type="password" id="pwd" name="pwd" class="form-control" maxlength="30" style="width: 200px; line-height: 3;">
                <input type="password" id="pwdcheck" name="pwdcheck" class="form-control" maxlength="30" onkeyup="passConfirm();" style="width: 200px; line-height: 3;">
                <div class="col-lg-12" type="text" id="checkmsg" name="checkmsg"></div>
            </div>

        </div>
    </form>
    <div>
        <input type="button" class="btn-upload" value="수정하기" onclick="setNewPwd()" style="margin-top: 100px">
    </div>
</div>

<script type="text/javascript">
    /* 자바 스크립트 함수 선언(비밀번호 확인) */

    function passConfirm() {
        /* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
        /* document : 현재 문서를 의미함. 작성되고 있는 문서를 뜻함. */
        /* getElementByID('아이디') : 아이디에 적힌 값을 가진 id의 value를 get을 해서 password 변수 넣기 */
        var pwd = document.getElementById("pwd");					//비밀번호
        var pwdcheck = document.getElementById("pwdcheck");	//비밀번호 확인 값
        var checkmsg = document.getElementById("checkmsg");				//확인 메세지
        var correctColor = "#20c997";	//맞았을 때 출력되는 색깔.
        var wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔
        if(pwd.value == pwdcheck.value){//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
            checkmsg.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
            checkmsg.innerHTML ="비밀번호 일치";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
        }else{
            checkmsg.style.color = wrongColor;
            checkmsg.innerHTML ="비밀번호 불일치";
        }
    }
</script>

<script>
    function setNewPwd(){
        var mbrPw = document.getElementById("mbr_pwd");
        var pw = document.getElementById("pw");

        var pwd = document.getElementById("pwd");					//비밀번호
        var pwdcheck = document.getElementById("pwdcheck");	//비밀번호 확인 값

        if(pwd.value == pwdcheck.value) {//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
            if (mbrPw.value == pw.value) {
                updatePw.submit();
            } else {
                alert("비밀번호가 틀렸습니다.");
            }
        }else{
            alert("새로운 비밀번호가 일치하지 않습니다.");
        }

        //window.close()
    }
</script>

</body>
</html>
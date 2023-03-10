<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>프로필 이미지 변경</title>

    <link rel="stylesheet" type="text/css" href="css/board.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div>
        <input type="file">
    </div>




<div class="col-lg-12" type="text" id="select_str" name="select_str"></div>


<div>
    <input type="button" class="btn-upload" value="선택" onclick="setParentText()">
</div>


<script>
    // 테이블의 Row 클릭시 값 가져오기
    $("#str_table tr").click(function(){

        var str = ""

        // 현재 클릭된 Row(<tr>)
        var tr = $(this);
        var td = tr.children();

        // tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
        console.log("클릭한 Row의 모든 데이터 : "+tr.text());

        // td.eq(index)를 통해 값을 가져오기
        var name = td.eq(1).text();


        str +=	"선택한 매장 : <b>" + name + "</b>";

        $("#select_str").html(str);
        $("#select_str").val(name);
    });
</script>


<script>
    function setParentText(){
        opener.document.getElementById("strName").value = document.getElementById("select_str").value
        window.close()
    }
</script>

</body>
</html>
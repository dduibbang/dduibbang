<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="header/header.jsp"%>
</head>
<body>
<br>
<div align="center" style="position: relative;">

    <%-- 게시물 검색폼--%>
    <form action="/home" method="get">
        <select name="searchType" style="left: 30%; height: auto">
            <option value="">선택</option>
            <option value="t">제목</option>
            <option value="n">글쓴이</option>
            <option value="j">희망직종</option>
        </select>
        <input name="searchKeyword" id="searchKeyword" type="text" placeholder="&nbsp;검색어를 입력하세요">
        <button style="border: 2px; padding: 4px">검색</button>
    </form>

</div>
</body>
<footer>
    <%@include file="header/footer.jsp"%>
</footer>
</html>
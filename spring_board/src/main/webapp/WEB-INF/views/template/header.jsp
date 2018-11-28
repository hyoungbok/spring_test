<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="root" value="${pageContext.request.contextPath }"/>   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style type="text/css">
</style>
</head>

<body>

<div style="background-color: #EEEEEE;">
<table class="table">
  <tr>
    <td class="td">
        <img src="${root}/images/main2.jpg" width="450" class="mx-auto d-block">
    </td>
  </tr>
  
  <tr>
    <td class="td">
    <ul class="nav nav-pills">
  <li class="nav-item">
    <a class="nav-link active" href="${root}/">홈</a>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">게시판</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="${root}/create">글쓰기</a>
      <a class="dropdown-item" href="${root}/list">목록</a>
    </div>
  </li>
</ul>
</td> 
  </tr>
 
</table>
</div>
<!-- 상단 메뉴 끝 -->
 
 
 
<!-- 내용 시작 -->
<div style="width: 100%; padding-top: 10px;">
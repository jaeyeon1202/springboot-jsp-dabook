<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!Doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>DABOOK</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        function infoAlert(url){
            if(${not empty userId}){
                window.location = url;
            }else {
                alert("로그인 먼저 해주세요");
                window.location="/dabook/main/login";
            }
        }
    </script>

</head>
<body >

<div class="text-center mt-3 mb-5">
    <a href="/dabook">
        <img src="/images/DABOOK.jpg"
             class="rounded"
             alt="asdf"
             width="15%"
        >
    </a>
</div>

<div>
    <nav class="navbar navbar-expand-lg mt-3 mb-5">
        <div class="container-xl">
            <a class="navbar-brand" href="/dabook">DABOOK</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/dabook/allBook">모든 책</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/dabook/bestSeller">베스트셀러</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/dabook/nowBook">요즘 이 책</a>
                    </li>
                    <li class="nav-item">
                        <c:if test="${not empty userId}">
                            <a class="nav-link" href="/dabook/main/logout">LOGOUT</a>
                        </c:if>
                        <c:if test="${empty userId}">
                            <a class="nav-link" href="/dabook/main/login">LOGIN</a>
                        </c:if>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" onclick="infoAlert('/dabook/user/cart?id=${userId}')">CART</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Mypage
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" onclick="infoAlert('/dabook/user/mypage?id=${userId}')">회원정보</a></li>
                            <li><a class="dropdown-item" onclick="infoAlert('/dabook/user/order/history?id=${userId}')">구매내역</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" onclick="infoAlert('/dabook/user/mypage/address')">주소 관리</a></li>
                        </ul>
                    </li>

                </ul>
                SEARCH &nbsp;
                <form class="d-flex" action="/dabook/searchBook" method="get">
                    <input class="form-control me-2" id="searchInput" name="data" type="text" placeholder="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>
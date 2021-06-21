<%--
  Created by IntelliJ IDEA.
  User: ssyy
  Date: 2021/06/18
  Time: 4:58 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>Chting! = 취미 + 미팅</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
    <!-- Load Require CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font CSS -->
    <link href="assets/css/boxicon.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
    <!-- Load Tempalte CSS -->
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/custom.css">
    <!-- Select2 CSS -->
    <link href="assets/css/nice-select.css" rel="stylesheet"/>

</head>
<!-- Header -->
<nav id="main_nav" class="navbar navbar-expand-lg navbar-light bg-white shadow">
    <div class="container d-flex justify-content-between align-items-center">
        <a id="navbar_logo" href="${pageContext.request.contextPath}/index_new.do">
            <img id="logo_img" src="${pageContext.request.contextPath}/images/new_chting_logo.png" alt="logo">
        </a>
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbar-toggler-success" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="align-self-center collapse navbar-collapse" id="navbar-toggler-success">
            <div class="navbar flex-fill mx-xl-5 d-flex justify-content-center">
                <div id="nav search" style="padding-right: 7%;">
                    <form class="form-inline" action="${pageContext.request.contextPath}/search.do" method="get">
                        <div class="input-group input-group-navbar justify-content-center">
                            <select name="category" class="form-control form-select-sm search" aria-label="Search">
                                <option value="">전체</option>
                                <c:forEach items="${applicationScope.appScope_areaList}" var="area">
                                    <c:choose>
                                        <c:when test="${search_category != area.area_name}">
                                            <option value="${area.area_name}">${area.area_name}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${area.area_name}" selected>${area.area_name}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                            <input name="search" id="searchValue" type="search" class="form-control form-control-sm"
                                   placeholder="Search…" aria-label="Search"
                                   value="<c:out value="${search_keyword}"></c:out>">
                            <button id="searchButton" class="btn btn-sm btn-outline-secondary" type="submit"><i
                                    class="bx bx-search bx-sm"></i></button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="navbar align-self-center d-flex">
                <a class="navbar-btn btn-sm btn-primary" href="myPage.do?userid=${sessionScope.get("userData").userid}">MyPage</a>
                <a class="navbar-btn btn-sm btn-primary" href="${pageContext.request.contextPath}/login">Login</a>
            </div>
        </div>
    </div>
</nav>
<div class="text-sm-center ">
<a>$ {sessionScope.get("userData").userid} : ${sessionScope.get("userData").userid}</a>&emsp;|&emsp;
<a>$ {sessionScope.get("userData").userrole} : ${sessionScope.get("userData").userrole}</a>&emsp;
<a href="index.html"><i class="bx bx-home bx-sm text-primary>"></i></a>
<a href="work.html"><i class="bx bx-search bx-sm text-primary>"></i></a>
<a href="work-single.html"><i class="bx bx-detail bx-sm text-primary>"></i></a>
<a>|</a>
<a href="${pageContext.request.contextPath}/myGroup.do"><i class="bx bx-user-plus bx-sm text-primary>"></i></a>
</div>
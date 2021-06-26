<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <style>
        .row {
            --bs-gutter-x: 1.5rem;
            --bs-gutter-y: 0;
            display: flex;
            flex-wrap: wrap;
            margin-top: calc(var(--bs-gutter-y) * -1);
            margin-right: calc(var(--bs-gutter-x) / -2);
            margin-left: calc(var(--bs-gutter-x) / -2);
        }

        .justify-content-center {
            -webkit-box-pack: center !important;
            -ms-flex-pack: center !important;
            justify-content: center !important;
        }

        .btn-toolbar {
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            -webkit-box-pack: start;
            -ms-flex-pack: start;
            justify-content: flex-start;
        }

        .row > * {
            -ms-flex-negative: 0;
            flex-shrink: 0;
            width: 100%;
            max-width: 100%;
            padding-right: calc(var(--bs-gutter-x) / 2);
            padding-left: calc(var(--bs-gutter-x) / 2);
            margin-top: var(--bs-gutter-y);
        }


    </style>
    <title>관리자</title>


<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
        <jsp:include page="/WEB-INF/views/include/adminSidebar.jsp"/>
    </ul>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <h1 class="h3 mb-2 text-gray-800">회원관리</h1>
                <p class="mb-4">Chting에 등록되어있는 회원들을 관리하세요</p>

                <div class="card shadow mb-4">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>UID</th>
                                    <th>성별</th>
                                    <th>닉네임</th>
                                    <th>이메일</th>
                                    <th>지역1</th>
                                    <th>지역2</th>
                                    <th>가입일</th>
                                </tr>
                                </thead>
                                <c:forEach var="i" items="${userList}">
                                    <tr>
                                        <td>${i.userid}</td>
                                        <td>${i.gender}</td>
                                        <td><a href="${pageContext.request.contextPath}/userPage.do?userid=${i.userid}">${i.nickname}</a></td>
                                        <td>${i.email}</td>
                                        <td>${i.first_area_name}</td>
                                        <td>${i.second_area_name}</td>
                                        <td>${i.joindate}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
            <!-- /.container-fluid -->
            <div class="row">
                <div class="btn-toolbar justify-content-center pb-4" role="toolbar"
                     aria-label="Toolbar with button groups">
                    <!-- 이전 버튼 -->
                    <c:choose>
                        <c:when test="${pm.cri.page == pm.startPage}">
                            <div class="btn-group me-2" role="group" aria-label="First group">
                                <button type="button" class="btn btn-secondary text-white disabled">Previous</button>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="btn-group me-2" role="group" aria-label="First group">
                                <button type="button" class="btn btn-secondary text-white"
                                        onclick="location.href='${pageContext.request.contextPath}/admin/adminUserManagement.do?page=${pm.cri.page-1}'">Previous
                                </button>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <!-- 이전 버튼 -->

                    <!-- 페이지 버튼 -->
                    <!-- 시작숫자 종료숫자 조건 -->
                    <c:choose>
                        <c:when test="${pm.endPage <= pm.displayPageNum}">
                            <c:set var="pageStartNumber" value="${pm.startPage}"/>
                            <c:set var="pageEndNumber" value="${pm.endPage}"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="pageStartNumber" value="${(pm.cri.page / pm.displayPageNum) + 1}"/>
                            <c:choose>
                                <c:when test="${pm.endPage < ((pm.cri.page / pm.displayPageNum) + 10)}">
                                    <c:set var="pageEndNumber" value="${pm.endPage}"/>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="pageEndNumber" value="${((pm.cri.page / pm.displayPageNum) + 10)}"/>
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach var="i" begin="${pageStartNumber}" end="${pageEndNumber}" varStatus="status">
                        <c:choose>
                            <c:when test="${pm.cri.page != i}">
                                <div class="btn-group me-2" role="group" aria-label="Second group">
                                    <button type="button" class="btn btn-secondary text-white"
                                            onclick="location.href='${pageContext.request.contextPath}/admin/adminUserManagement.do?&page=${i}'">${i}</button>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="btn-group me-2" role="group" aria-label="Second group">
                                    <button type="button" class="btn btn-light" disabled>${i}</button>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pm.endPage == 0}">
                        <div class="btn-group me-2" role="group" aria-label="Second group">
                            <button type="button" class="btn btn-light" disabled>&#9825;</button>
                        </div>
                    </c:if>
                    <!-- 페이지 버튼 -->

                    <!-- 다음 버튼 -->
                    <c:choose>
                        <c:when test="${pm.cri.page < pm.endPage}">
                            <div class="btn-group" role="group" aria-label="Third group">
                                <button type="button" class="btn btn-secondary text-white"
                                        onclick="location.href='${pageContext.request.contextPath}/admin/adminUserManagement.do?&page=${pm.cri.page+1}'">Next
                                </button>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="btn-group" role="group" aria-label="Third group">
                                <button type="button" class="btn btn-secondary text-white" disabled>Next</button>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <!-- 다음 버튼 -->
                </div>
            </div>

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Your Website 2020</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

</body>

</head>

<script>
    //모임관리가져오기

</script>


</html>
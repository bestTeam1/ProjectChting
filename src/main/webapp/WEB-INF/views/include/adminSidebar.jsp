<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>


<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath}/assets/dashboard/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/dashboard/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath}/assets/dashboard/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/assets/dashboard/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="${pageContext.request.contextPath}/assets/dashboard/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="${pageContext.request.contextPath}/assets/dashboard/js/demo/chart-area-demo.js"></script>
<script src="${pageContext.request.contextPath}/assets/dashboard/s/demo/chart-pie-demo.js"></script>


<!-- Custom fonts for this template-->
<link href="${pageContext.request.contextPath}/assets/dashboard/vendor/fontawesome-free/css/all.min.css"
      rel="stylesheet" type="text/css">
<link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath}/assets/dashboard/css/sb-admin-2.css" rel="stylesheet">
<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/admin/adminIndex.do">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class=""></i>
        </div>
        <div class="sidebar-brand-text mx-3"><img src="${pageContext.request.contextPath}/images/chting_logo.png"
                                                  width="100%" height="100%"></div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminIndex.do">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>대시보드</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Chting board
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminNotice.do">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>공지사항</span></a>
    </li>

    <!-- Nav Item - Utilities Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminEvent.do">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>이벤트</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Chting user management
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
           aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-fw fa-folder"></i>
            <span>관리</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header"></h6>
                <a class="collapse-item" href="${pageContext.request.contextPath}/admin/adminUserManagement.do">회원관리</a>
                <a class="collapse-item"
                   href="${pageContext.request.contextPath}/admin/adminGroupManagement.do">모임관리</a>
            </div>
        </div>
    </li>
</ul>
<!-- End of Sidebar -->
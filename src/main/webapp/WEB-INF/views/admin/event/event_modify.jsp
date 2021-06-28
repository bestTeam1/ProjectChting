<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">


    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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

        <div class="row">
            <h1 style="text-align: center; margin-top: 50px">이벤트 수정</h1>
        </div>
        <!-- Main Content -->
        <!-- Start Service -->
        <section class="container my-lg-5">
            <form id="write" method="post" action='${pageContext.request.contextPath}/admin/adminEventModifyOk.do'
                  enctype="multipart/form-data">
                <!-- userid와 eventNo 들고감 -->
                <input type="hidden" name="userid" value="${sessionScope.get("userData").userid}">
                <input type="hidden" name="event_no" value="${event.event_no}">
                <div class="service-wrapper py-3">
                    <input type="date" id="startdate" name="startdate" value="${event.startdate}"> ~
                    <input type="date" id="enddate" name="enddate" value="${event.enddate}" >

                    <%-- 제목 --%>
                    <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
                        <div class="row p-2">
                            <div class="pricing-list-icon col-3 text-center m-auto text-secondary ml-5 py-2">
                                <i class="display-3 bx bx-edit"></i>
                                <p>제목</p>
                            </div>
                            <div class="pricing-list-body col-md-5 align-items-center pl-3 pt-2">
                                <ul class="list-unstyled text-center light-300">
                                    <div class="form-floating mb-4">
                        <textarea name="subject" id="subject" class="form-control form-control-lg light-300"
                                  style="resize: none; width: 800px; height: 80px; ">${event.subject}</textarea>

                                        <p align="left" id="subjectKeyUp"></p>

                                    </div>
                                </ul>
                            </div>
                            <div class="pricing-list-footer col-4 text-center m-auto align-items-center">
                            </div>
                        </div>
                    </div>

                    <%-- 내용 --%>
                    <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
                        <div class="row p-2">
                            <div class="pricing-list-icon col-3 text-center m-auto text-secondary ml-5 py-2">
                                <i class="display-3 bx bx-edit"></i>
                                <p>내용</p>
                            </div>
                            <div class="pricing-list-body col-md-5 align-items-center pl-3 pt-2">
                                <ul class="list-unstyled text-center light-300">
                                    <div class="form-floating mb-4">
                        <textarea name="content" id="content" class="form-control form-control-lg light-300"
                                  style="resize: none; width: 800px; height: 300px;"> ${event.content}</textarea>

                                        <p align="left" id="contentKeyUp"></p>

                                    </div>
                                </ul>
                            </div>
                            <div class="pricing-list-footer col-4 text-center m-auto align-items-center">
                            </div>
                        </div>
                    </div>

                    <%-- 첨부 파일 --%>
                    <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
                        <div class="row p-2">
                            <div class="pricing-list-icon col-3 text-center m-auto text-secondary ml-5 py-2">
                                <i class="display-3 bx bx-image-add"></i>
                                <p>첨부 파일</p>
                            </div>
                            <div class="pricing-list-body col-md-5 align-items-center pl-3 pt-2">
                                <ul class="list-unstyled text-center light-300">
                                    <div class="form-floating mb-4">
                                        <div class="input-group">
                                            <input type="file" class="form-control" id="fileName" name="uploadFile"/>
                                        </div>
                                    </div>
                                </ul>
                            </div>
                            <div class="pricing-list-footer col-4 text-center m-auto align-items-center">
                            </div>
                        </div>
                    </div>
                </div>

                <input type="hidden" value="${event.event_no}" name="event_no" >
                <input type="hidden" id="currentDate" name="currentDate">
                <input type="hidden" value="${page}" name="page" >
            </form>
            <div style="display: flex; justify-content: center">
                <input type="submit" class="banner-button btn rounded-pill btn-primary btn-lg px-4 my-lg-5"
                       style="margin-right: 10px;"
                       id="submit" value="수정"/>
                <button type="button" class="banner-button btn rounded-pill btn-primary btn-lg px-4 my-lg-5"
                        onclick="location.href='adminEvent.do?page=${page}'">목록
                </button>
            </div>
        </section>

        <!-- End of Main Content-->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Chting</span>
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

<script type="text/javascript">

    $('#submit').click(function (){
       $('#write').submit();
    });

    //오늘날짜
    Date.prototype.toDateInputValue = (function () {
        var local = new Date(this);
        local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
        return local.toJSON().slice(0, 10);
    });

    //오늘날짜
    $(document).ready(function () {
        $('#currentDate').val(new Date().toDateInputValue());
        $('#enddate').attr("min",$('#startdate').val());
    });

    $('#back').click(()=>{
        window.location.href='${pageContext.request.contextPath}/admin/adminEvent.do?page=${page}';
    });
</script>

</html>
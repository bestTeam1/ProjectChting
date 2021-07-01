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

                <h1 class="h3 mb-2 text-gray-800">공지사항</h1>
                <p class="mb-4">Chting 공지사항을 관리하세요</p>

                <section>
                    <div class="content">
                        <header id="detailBody">
                            <ul class="team-member-caption list-unstyled text-center pt-4 text-muted light-300">
                                <h2 id="subject" style="vertical-align: text-bottom;">
                                    <img src="http://drive.google.com/uc?export=view&id=1rNujOwPH73iMFcEA-gEQoWKlwPhXPGVz"
                                         width="50px" height="50px"
                                         style="display: inline-block; box-sizing: border-box;
                                       margin-bottom:10px; margin-right: 10px; border-radius: 50%; vertical-align: middle;"></span>
                                    ${detail.subject}
                                </h2>
                            </ul>
                            <ul class="team-member-caption list-unstyled text-center pt-4 text-muted light-300">
                                <br>
                                <img src="${pageContext.request.contextPath}/upload/notice/${detail.file}"/>
                                <h2>${detail.content}</h2>

                                <div style="display: flex; justify-content: center; margin-top: 25px; margin-bottom: 25px;">
                                    <c:if test='${sessionScope.get("userData").userrole.equals("ROLE_ADMIN")}'>

                                        <button type="button"
                                                class="banner-button btn rounded-pill btn-primary btn-lg px-4 mt-lg-5"
                                                id="modify">수정
                                        </button>
                                        &nbsp;
                                        &nbsp; &nbsp; &nbsp; &nbsp;
                                        <button type="button"
                                                class="banner-button btn rounded-pill btn-primary btn-lg px-4 mt-lg-5"
                                                id="delete">삭제
                                        </button>
                                        &nbsp;
                                        &nbsp; &nbsp; &nbsp; &nbsp;
                                        &nbsp;
                                    </c:if>
                                    <button type="button"
                                            class="banner-button btn rounded-pill btn-primary btn-lg px-4 mt-lg-5"
                                            id="back">목록
                                    </button>
                                </div>
                                <br><br>
                                <div style="text-align: center">
                                </div>
                            </ul>
                        </header>
                    </div>
                </section>


            </div>
            <!-- /.container-fluid -->

            <div class="btn-toolbar"></div>
        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Chting 2020</span>
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

    //수정 클릭
    $(document).on("click", "#modify", function (e) {
        e.preventDefault();

        Swal.fire({
            title: '공지사항 수정',
            text: '공지사항을 수정하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#A0A0FF',
            cancelButtonColor: '#aaaaaa',
            confirmButtonText: '네',
            cancelButtonText: '아니오'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = "${pageContext.request.contextPath}/admin/adminNoticeModify.do?noticeNo=${detail.notice_no}&page=${page}"
            }
        })
    });

    //삭제 클릭
    $(document).on("click", "#delete", function (e) {
        e.preventDefault();

        Swal.fire({
            title: '공지사항 삭제',
            text: '공지사항을 삭제하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#A0A0FF',
            cancelButtonColor: '#aaaaaa',
            confirmButtonText: '네',
            cancelButtonText: '아니오'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '공지 삭제',
                    text: '공지가 삭제되어 목록으로 돌아갑니다'
                }).then((result) => {
                    window.location.href = "${pageContext.request.contextPath}/admin/adminDeleteBoard.do?type=Notice&num=${detail.notice_no}&page=${page}";
                })

            } else {
                swal.fire({
                    title: '삭제 취소',
                    text: '삭제를 취소하셨습니다'
                })
            }
        })
    });
    //목록 클릭
    $(document).on("click", "#back", function (e) {
        e.preventDefault();

        window.location.href = "${pageContext.request.contextPath}/admin/adminNotice.do?page=${page}";
    });
</script>


</html>
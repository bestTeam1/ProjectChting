<%--
  Created by IntelliJ IDEA.
  User: hyunsangjin
  Date: 2021/06/07
  Time: 2:42 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar Example</title>
    <link rel="stylesheet" href="vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='vendor/css/select2.min.css' />
    <link rel="stylesheet" href='vendor/css/bootstrap-datetimepicker.min.css' />
    <link rel="stylesheet" href="css/main.css">


</head>
<body class="is-preload">
<!-- Wrapper -->
<%--<div id="wrapper">--%>
<div id="wrapper">
    <!-- Main -->
    <div id="main">
        <div class="inner">
            <jsp:include page="/WEB-INF/views/include/header.jsp"/>
            <!-- Banner -->
            <section>
                <div class="content">
                    <header>
                        <h2>쿠키런킹덤 - 일정표</h2>
                    </header>
                    <div class="container">

                        <!-- 일자 클릭시 메뉴오픈 -->
                        <div id="contextMenu" class="dropdown clearfix">
                            <ul class="dropdown-menu dropNewEvent" role="menu"
                                aria-labelledby="dropdownMenu"
                                style="display: block; position: static; margin-bottom: 5px;">
                                <li><a tabindex="-1" href="#">일정 생성</a></li>
                                <li class="divider"></li>
                                <li><a tabindex="-1" href="#" data-role="close">닫기</a></li>
                            </ul>
                        </div>

                        <div id="wrapper">
                            <div id="loading"></div>
                            <div id="calendar"></div>
                        </div>


                        <!-- 일정 추가 MODAL -->
                        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                        <h4 class="modal-title"></h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <label class="col-xs-4" for="edit-title">일정명</label> <input
                                                    class="inputModal" type="text" name="title"
                                                    id="edit-title" required="required" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <label class="col-xs-4" for="edit-start">시작</label> <input
                                                    class="inputModal" type="text" name="start"
                                                    id="edit-start" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <label class="col-xs-4" for="edit-end">끝</label> <input
                                                    class="inputModal" type="text" name="end" id="edit-end" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-xs-12">
                                                <label class="col-xs-4" for="edit-desc">설명</label>
                                                <textarea rows="4" cols="50" class="inputModal" name="description"
                                                          id="edit-desc"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer modalBtnContainer-addEvent">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                                    </div>
                                    <div class="modal-footer modalBtnContainer-modifyEvent">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                                        <div class="btn btn-danger" id="deleteEvent">삭제</div>
                                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->

                    </div>
                    <!-- /.container -->


                </div>
            </section>
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
</div>
<script src="vendor/js/jquery.min.js"></script>
<script src="vendor/js/bootstrap.min.js"></script>
<script src="vendor/js/moment.min.js"></script>
<script src="vendor/js/fullcalendar.min.js"></script>
<script src="vendor/js/ko.js"></script>
<script src="vendor/js/select2.min.js"></script>
<script src="vendor/js/bootstrap-datetimepicker.min.js"></script>
<script src="js/main.js"></script>
<script src="js/addEvent.js"></script>
<script src="js/editEvent.js"></script>
<script src="js/etcSetting.js"></script>
</body>
</html>
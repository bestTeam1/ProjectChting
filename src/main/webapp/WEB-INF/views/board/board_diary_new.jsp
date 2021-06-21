<%--
  Created by IntelliJ IDEA.
  User: ssyy
  Date: 2021/06/21
  Time: 11:43 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar Example</title>
    <link rel="stylesheet" href="fullcalendar/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="fullcalendar/css/bootstrap.min.css">
    <link rel="stylesheet" href='fullcalendar/css/select2.min.css' />
    <link rel="stylesheet" href='fullcalendar/css/bootstrap-datetimepicker.min.css' />
    <link rel="stylesheet" href="fullcalendar/css/main.css">
</head>
<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header_new.jsp"/>
<!-- Close Header / <head> -->
<!-- Start Work Sigle -->
<c:set var="userid" value="${sessionScope.get('userData').userid}" />

<!-- Start Board SideBar -->
<jsp:include page="board_include/board_sidebar.jsp" />
<!-- End Board SideBar -->

<section class="container-fluid">
    <div class="row justify-content-center pb-4">
        <div class="col-lg-8 mt-3">
            <h3>일정표</h3>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-lg-8 ml-auto mr-auto pt-3 pb-4">
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
    </div>

</section>



<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer_new.jsp"/>
<!-- End Footer / Script -->

<script src="fullcalendar/js/jquery.min.js"></script>
<script src="fullcalendar/js/bootstrap.min.js"></script>
<script src="fullcalendar/js/moment.min.js"></script>
<script src="fullcalendar/js/fullcalendar.min.js"></script>
<script src="fullcalendar/js/ko.js"></script>
<script src="fullcalendar/js/select2.min.js"></script>
<script src="fullcalendar/js/bootstrap-datetimepicker.min.js"></script>
<script src="fullcalendar/js/main.js"></script>
<script src="fullcalendar/js/addEvent.js"></script>
<script src="fullcalendar/js/editEvent.js"></script>
<script src="fullcalendar/js/etcSetting.js"></script>
</body>
</html>

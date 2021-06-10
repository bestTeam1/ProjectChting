<%--
  Created by IntelliJ IDEA.
  User: hyunsangjin
  Date: 2021/06/07
  Time: 2:42 오후
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset=UTF-8">
    <title>내가 가입한 모임 - 일정</title>
    <style>
        html,
        body {
            position: relative;
            height: 100%;
        }
        body {
            background: #eee;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            color: #000;
            margin: 0;
            padding: 0;
        }
        .swiper-container {
            width: 100%;
            height: 100%;
        }
        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;
            /* Center slide text vertically */
            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
            align-items: center;
        }
        .swiper-slide img {
            display: block;
            width: 100%;
            height: 50%;
            object-fit: cover;
        }
        a { text-decoration:none !important }
        a:hover { text-decoration:none !important }
    </style>
</head>
<body class="is-preload">
<link rel="stylesheet" href="assets/css/fullcalendar_main.css">



<!-- Wrapper -->
<%--<div id="wrapper">--%>
<div>
    <!-- Main -->
    <div id="main">
        <div class="inner">
            <jsp:include page="/WEB-INF/views/include/header.jsp" />
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
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
</div>

</body>

</html>
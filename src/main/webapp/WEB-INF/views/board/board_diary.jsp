<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="${pageContext.request.contextPath}/fullcalendar/css/main.min.css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/fullcalendar/js/main.min.js"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- modal -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css"/>
    <!-- dateFormat을 위한 momentjs -->
    <script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js"
            type="text/javascript"></script>
    <!-- KakaoMap API -->
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<spring:eval expression="@properties['kakaoapi.key']"/>&libraries=services"></script>
    <!-- Daum 주소검색 API -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <style>
        .fc-event {
            margin-top: 5px;
            cursor: grabbing;
        }

        .fc-event-title {
            cursor: grabbing;
        }

        #footerDiv {
            height: 90%;
        }

        #external-events {
            padding-top: 2%;
        }

        .saveBtn {
            margin-left: 8%;
            margin-top: 10px;
            text-align: center;
        }

        input[type="text"] {
            width: 80% !important;
            margin-top: 20px;
        }

        .chtingCalForm {
            width: 50%;
        }

        .chtingCal {
            text-align: center;
        }

        .formBtn {
            width: 20%;
            margin-left: 20px;
            margin-top: 25px;
        }

        #chtingCalAddress {
            cursor: pointer;
        }

    </style>
    <title>Calendar</title>
</head>

<div id="wrapper">
    <!-- Main -->
    <div id="main">
        <div class="inner">
            <jsp:include page="/WEB-INF/views/include/header.jsp"/>
            <!-- Banner -->


            <section style="position: relative">
                <div id="ex1" class="modal">
                    <h3 class="chtingCal"> 일정을 추가하세요! </h3>
                    <div>
                        <form id="form" name="diaryOkForm">
                            <div style="display: flex; justify-content: center">
                                <input class="chtingCal" id="chtingCalType" type="text" disabled>
                            </div>
                            <div style="display: flex; justify-content: center">
                                <input class="chtingCal" id="chtingCalDate" type="text" disabled>
                            </div>
                            <div style="display: flex; justify-content: center">
                                <input class="chtingCal" id="chtingCalAddress" type="text" onclick="address()"
                                       value="위치를 입력해 주세요">
                            </div>

                            <div style="display: flex; justify-content: center">
                                <button class="formBtn" id="diarySubmit" > 확인</button>

                            </div>
                        </form>
                        <div style="display: table; justify-content: right">
                            <div id="map" style="width: 450px; height: 450px;"></div>
                        </div>
                    </div>
                </div>

                <!-- Link to open the modal -->
                <p><a id="modal" href="#ex1" rel="modal:open">Open Modal</a></p>
                <div id='external-events' style="width: 15%; float: left; padding-right: 30px; padding-left: 20px;">
                    <p>
                        <strong>이벤트 생성하기</strong>
                    </p>

                    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                        <div class='fc-event-main'>정모</div>
                    </div>
                    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                        <div class='fc-event-main'>번개</div>
                    </div>
                    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                        <div class='fc-event-main'>언택트</div>
                    </div>
                    <%--
                    <p>
                        <input type='checkbox' id='drop-remove'/>
                        <label for='drop-remove'>드롭 후 제거</label>
                    </p>
                    --%>
                    <button class="saveBtn" onclick="allSave()">저장</button>
                </div>
                <div id='calendar' style="width: 80%; float: left">
                </div>
            </section>
            <div id="footerDiv"></div>
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
</div>
</body>
<script>
    var calendar = null;
    //풀캘린더
    $(document).ready(function () {

        var Calendar = FullCalendar.Calendar;
        var Draggable = FullCalendar.Draggable;

        var containerEl = document.getElementById('external-events');
        var calendarEl = document.getElementById('calendar');
        var checkbox = document.getElementById('drop-remove');

        // initialize the external events
        // -----------------------------------------------------------------

        new Draggable(containerEl, {
            itemSelector: '.fc-event',
            eventData: function (eventEl) {
                return {
                    title: eventEl.innerText
                };
            }
        });

        // initialize the calendar
        // -----------------------------------------------------------------

        calendar = new Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            locale: 'ko',
            headerToolbar: {
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            editable: true,
            droppable: true, // this allows things to be dropped onto the calendar
            //내려놨을때 form불러와서 데이터를 추가로 받는다
            drop: function (info) {
                $('#modal').click();

                console.log(info);
                console.log(info.dateStr);
                console.log(moment(info.dateStr).format('YYYY/MM/DD'));
                $('#chtingCalType').val(info.draggedEl.innerText);
                $('#chtingCalDate').val(moment(info.dateStr).format('YYYY년 MM월DD 일  HH시'));

                makeMap();
            }
        });

        calendar.render();
    });

    //1. 전체 이벤트리스트
    function allSave() {
        var allEvent = calendar.getEvents();

        var events = new Array();
        for (var i = 0; i < allEvent.length; i++) {

            var obj = new Object();

            //fullcalendar로 받은 정보 넣기
            obj.type = allEvent[i]._def.title;
            obj.date = allEvent[i]._instance.range.start;

            events.push(obj);
        }
        var jsondata = JSON.stringify(events);
        console.log(jsondata);

        savedata(jsondata);
    }

    function savedata(jsondata) {
        $.ajax({
            url: "saveEvent.do",
            data: {
                "alldata": jsondata
            },
            dataType: "json",
            type: "get",
            success(data) {


            },
            error: console.log("error")
        });

    }

    function makeMap() {
        var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
        var options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(37.499427, 127.029027), //지도의 중심좌표.
            level: 3 //지도의 레벨(확대, 축소 정도)
        };

        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴


        // 지도를 클릭한 위치에 표출할 마커입니다
        var marker = new kakao.maps.Marker({
            // 지도 중심좌표에 마커를 생성합니다
            position: map.getCenter()
        });
        // 지도에 마커를 표시합니다
        marker.setMap(map);

        // 지도에 클릭 이벤트를 등록합니다
        // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
        kakao.maps.event.addListener(map, 'click', function (mouseEvent) {

            // 클릭한 위도, 경도 정보를 가져옵니다
            var latlng = mouseEvent.latLng;

            // 마커 위치를 클릭한 위치로 옮깁니다
            marker.setPosition(latlng);

            var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
            message += '경도는 ' + latlng.getLng() + ' 입니다';

            var resultDiv = document.getElementById('clickLatlng');
            resultDiv.innerHTML = message;

        });
    }

    function panTo() {
        // 이동할 위도 경도 위치를 생성합니다
        var moveLatLon = new kakao.maps.LatLng(37.499427, 127.029027);

        // 지도 중심을 부드럽게 이동시킵니다
        // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
        map.panTo(moveLatLon);
    }

    function address() {
        new daum.Postcode({
            oncomplete: function (data) {

                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var jibunAddr = data.jibunAddress; // 지번 주소 변수
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('chtingCalAddress').value = data.zonecode;
                if (roadAddr !== '') {
                    document.getElementById("chtingCalAddress").value = roadAddr;
                } else if (jibunAddr !== '') {
                    document.getElementById("chtingCalAddress").value = jibunAddr;
                }

                //지번이 chtingCalAddress에 들어간 이후
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                    mapOption = {
                        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    };
                //주소이름을 가져옵니다
                var location = $('#chtingCalAddress').val()

                // 지도를 생성합니다
                var map = new kakao.maps.Map(mapContainer, mapOption);

                // 주소-좌표 변환 객체를 생성합니다
                var geocoder = new kakao.maps.services.Geocoder();

                // 주소로 좌표를 검색합니다
                geocoder.addressSearch(location, function (result, status) {

                    // 정상적으로 검색이 완료됐으면
                    if (status === kakao.maps.services.Status.OK) {

                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                        // 결과값으로 받은 위치를 마커로 표시합니다
                        var marker = new kakao.maps.Marker({
                            map: map,
                            position: coords
                        });

                        // 인포윈도우로 장소에 대한 설명을 표시합니다
                        var infowindow = new kakao.maps.InfoWindow({
                            content: '<div style="width:150px;text-align:center;padding:6px 0;">모임장소</div>'
                        });
                        infowindow.open(map, marker);

                        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                        map.setCenter(coords);
                    }
                });
            }
        }).open();
    }

    $('#diarySubmit').on('click', function(e) {
        e.preventDefault();
        $('.close-modal').click();
        $.ajax({
            url: "board_diaryOk.do",
            data: {
                type : $('#chtingCalType').val(),
                date : $('#chtingCalDate').val(),
                address : $('#chtingCalAddress').val()
            },
            type: "get",
            success: function (response) {


                Swal.fire({
                    title: '일정',
                    text : '일정이 추가되었습니다!'
                }).then((result) => {
                    //modal팝업 닫기
                    $('.close-modal').click();
                })
            },
            error: function (Http, status, error) {
                console.log("Http : " + Http + ", status : " + status + ", error : " + error);
            }
        });
    });

    function groupDiaryOk() {



    }

</script>
</html>
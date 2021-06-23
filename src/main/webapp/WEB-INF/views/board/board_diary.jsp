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

        #chtingCalLocation {
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
                        <form id="form" name="diaryOkForm" onsubmit="return false">
                            <div style="display: flex; justify-content: center">
                                <input class="chtingCal" id="chtingCalType" type="text" disabled>
                            </div>
                            <div style="display: flex; justify-content: center">
                                <input class="chtingCal" id="chtingCalDate" type="text" disabled>
                            </div>
                            <div style="display: flex; justify-content: center">
                                <input class="chtingCal" id="chtingContent" type="text" placeholder="제목">
                            </div>
                            <div style="display: flex; justify-content: center">
                                <input class="chtingCal" id="chtingSubject" type="text" placeholder="내용">
                            </div>
                            <div style="display: flex; justify-content: center">
                                <input class="chtingCal" id="chtingCalLocation" type="text" onclick="searchMap()"
                                       placeholder="장소를 알려주세요!">
                            </div>
                            <input type="hidden" name="xcoord" id="xcoord"/>
                            <input type="hidden" name="ycoord" id="ycoord"/>
                            <div style="display: flex; justify-content: center">
                                <button class="formBtn" id="diarySubmit"> 확인</button>
                                <a id="refuse" href="#" class="button primary fit">가입거절</a>
                            </div>
                        </form>
                        <div style="display: table; justify-content: right">
                            <div id="map" style="width: 450px; height: 300px;"></div>
                        </div>
                    </div>
                </div>

                <!-- Link to open the modal -->
                <p ><a id="modal" href="#ex1" rel="modal:open"></a></p>
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
        var all_events = null; //처음 로딩시에 불러올 일정


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
            events: loadingEvents()
            ,
            eventClick: function (event) {
                var schedule_no = event.event.extendedProps.schedule_no//클릭한 이벤트의 스케쥴넘버(DB)
                //ajax로 해당 스케줄의 정보 가져와서 출력
                $.ajax({
                    url: "board_diary_detail.do",
                    type: 'POST',
                    dataType: 'JSON',
                    async : false,
                    data: {
                        group_no: '${group_no}',
                        schedule_no: schedule_no
                    },
                    success: function (response) {
                        console.log(response);
                        $('#chtingCalType').val(response.type);
                        $('#chtingCalDate').val(response.calDate);
                        $('#chtingContent').val(response.content);
                        $('#chtingSubject').val(response.subject);
                        $('#xcoord').val(response.xcoord);
                        $('#ycoord').val(response.ycoord);

                        $('#chtingCalLocation').attr('placeholder', '장소를 바꾸시겠습니까?');
                    },
                    error: function (Http, status, error) {
                        console.log(error);
                    }
                });

                $('#modal').click();
                $('#map').empty();
                makeMap();
            },
            //내려놨을때 form불러와서 데이터를 추가로 받는다
            drop: function (info) {
                $('#modal').click();

                $('#chtingCalType').val(info.draggedEl.innerText);
                $('#chtingCalDate').val(moment(info.dateStr).format('YYYY-MM-DD'));

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

    function loadingEvents() { //처음 페이지 로딩시 이벤트 불러오기, json형태로
        var return_value = null;
        $.ajax({
            type: 'POST',
            url: 'board_diaryEvents.do',
            async: false,
            data: {
                group_no: '${group_no}' //group_no를 통해 해당그룹의 이벤트정보들 가져옴
            },
            dataType: 'JSON',
            success(response) {
                return_value = response;
            }
        })
        return return_value;
    }

    function makeMap() {
        $('#map').empty();

        var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
        var options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng($('#ycoord').val(), $('#xcoord').val()), //지도의 중심좌표.
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


    function address() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var jibunAddr = data.jibunAddress; // 지번 주소 변수
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('chtingCalLocation').value = data.zonecode;
                if (roadAddr !== '') {
                    document.getElementById("chtingCalLocation").value = roadAddr;
                } else if (jibunAddr !== '') {
                    document.getElementById("chtingCalLocation").value = jibunAddr;
                }
                //가져온 주소로 이동
                moveMap();
            }
        }).open();
    }

    //위치에 표시된 장소로 맵을 이동하는 기능
    function searchMap() {

        // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
        var infowindow = new kakao.maps.InfoWindow({zIndex: 1});

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng($('#ycoord').val(), $('#xcoord').val()), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        // 지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 장소 검색 객체를 생성합니다
        var ps = new kakao.maps.services.Places();

        // 키워드로 장소를 검색합니다
        ps.keywordSearch($('#chtingCalLocation').val(), placesSearchCB);

        // 키워드 검색 완료 시 호출되는 콜백함수 입니다
        function placesSearchCB(data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                // LatLngBounds 객체에 좌표를 추가합니다
                var bounds = new kakao.maps.LatLngBounds();

                for (var i = 0; i < data.length; i++) {
                    displayMarker(data[i]);
                    bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                }

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                map.setBounds(bounds);
            }
        }

        // 지도에 마커를 표시하는 함수입니다
        function displayMarker(place) {

            // 마커를 생성하고 지도에 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(place.y, place.x)
            });


            // 마커에 클릭이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'click', function () {
                // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
                infowindow.open(map, marker);
                $('#xcoord').val(place.x);
                $('#ycoord').val(place.y);
                Swal.fire({
                    title: '일정',
                    text: place.place_name + '장소로 등록되었습니다!'
                })

            });
        }
    }

    //일정 만들기 확인 클릭
    $('#diarySubmit').on('click', function (e) {
        e.preventDefault();
        $.ajax({
            url: "board_diaryOk.do",
            type: "GET",
            async: false,
            data: {
                group_no: '${group_no}',
                type: $('#chtingCalType').val(),
                date: $('#chtingCalDate').val(),
                subject: $('#chtingSubject').val(),
                content: $('#chtingContent').val(),
                location: $('#chtingCalLocation').val(),
                xcoord : $('#xcoord').val(),
                ycoord : $('#ycoord').val()
            },
            success: function (response) {
                Swal.fire({
                    title: '일정',
                    text: '일정이 추가되었습니다!'
                }).then((result) => {
                    //modal팝업 닫기
                    $('.close-modal').click();
                })
            },
            error: function (Http, status, error) {
                console.log(error);
            }
        });
    });

    function groupDiaryOk() {


    }

</script>
</html>
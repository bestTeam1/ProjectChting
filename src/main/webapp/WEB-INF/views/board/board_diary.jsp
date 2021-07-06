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
    <!-- jquery modal popup-->
    <!-- dateFormat을 위한 momentjs -->
    <script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js"
            type="text/javascript"></script>
    <!-- KakaoMap API -->
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<spring:eval expression="@properties['kakaoapi.key']"/>&libraries=services"></script>
    <style>
        .fc-event {
            margin-top: 5px;
            cursor: grabbing;
        }

        .fc-event-title {
            cursor: grabbing;
        }

        #external-events {
            padding-top: 1%;
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

        input[type="text"] {
            text-align: center;
            width: 90% !important;
            margin-top: 20px;
        }

        .formBtn {
            width: 20%;
            margin-left: 20px;
            margin-top: 25px;
        }

        #chtingCalLocation {
            cursor: pointer;
        }

        #cancelEvent {
            width: 20%;
            margin-top: 25px;
            margin-left: 20px;
        }

        #calendar {
            width: 80%;
            height: 88%;
            float: left;
        }

    </style>
    <title>Calendar</title>
</head>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<jsp:include page="/WEB-INF/views/board/board_include/board_sidebar.jsp"/>
<div id="wrapper" class="container-fluid mb-5">
    <!-- Main -->
    <div id="main" class="row my-2 d-flex justify-content-center">
        <div class="inner col-md-10 col-12">

            <!-- Banner -->
            <section class="row d-flex justify-content-end gy-4 gx-md-4 mb-md-5 mt-md-2">

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="ModalLabel">일정을 추가하세요!</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="form" name="diaryOkForm" onsubmit="return false">
                                    <div class="form-floating mb-3 chtingCal" style="margin-left: 10%">
                                        <input type="text" class="form-control" id="chtingCalType" disabled>
                                        <label for="chtingCalType">모임유형</label>
                                    </div>
                                    <div class="form-floating mb-3 chtingCal" style="margin-left: 10%">
                                        <input type="text" class="form-control" id="chtingCalDate" disabled>
                                        <label for="chtingCalDate">모임날짜</label>
                                    </div>
                                    <div class="form-floating mb-3 chtingCal" style="margin-left: 10%">
                                        <input type="text" class="form-control" id="chtingContent">
                                        <label for="chtingContent">제목</label>
                                    </div>
                                    <div class="form-floating mb-3 chtingCal" style="margin-left: 10%">
                                        <input type="text" class="form-control" id="chtingSubject">
                                        <label for="chtingSubject">내용</label>
                                    </div>
                                    <div class="form-floating mb-3 chtingCal" style="margin-left: 10%">
                                        <input type="text" class="form-control" id="chtingCalLocation"
                                               onclick="searchMap()" placeholder="장소를 알려주세요!">
                                        <label for="chtingCalLocation" id="placeholderForSearch">&#128270; 장소를
                                            알려주세요!</label>
                                    </div>


                                    <div style="display: flex; justify-content: center">
                                        <input class="chtingCal" type="hidden" type="text">
                                    </div>
                                    <!-- 카카오맵 기본좌표 강남 비트캠프 -->
                                    <input type="hidden" name="xcoord" id="xcoord" value="127.029018585511"/>
                                    <input type="hidden" name="ycoord" id="ycoord" value="37.4994547195947"/>
                                    <input type="hidden" name="schedule_no" id="chtingScheduleNo" value=""/>
                                </form>
                                <div style="display: table; justify-content: right">
                                    <div id="map" style="width: 465px; height: 300px;"></div>
                                </div>
                            </div>
                            <div class="modal-footer" id="buttonDiv">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="">닫기
                                </button>
                                <button type="button" class="btn btn-primary" id="diarySubmit">저장</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Calendar -->
                <div class="col-md-2 col-5" id='external-events'>
                    <p>
                        <strong>일정 생성하기</strong>
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
                </div>
                <div class="col-md-10 col-auto flex-fill" id='calendar' style="min-width: initial; min-height: 80vh;">
                </div>
                <!-- Calendar end -->
            </section>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
<script>
    var calendarModal = new bootstrap.Modal(document.getElementById('exampleModal'))
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
            headerToolbar: {},
            editable: true,
            droppable: true, // this allows things to be dropped onto the calendar
            events: loadingEvents()
            ,
            eventClick: function (event) {
                $('#map').empty();
                $('#ModalLabel').text('일정을 확인하세요!'); //이벤트 클릭시에는 일정확인 메세지로 변경
                //클릭시에는 이미있는 이벤트를 삭제할수있는 삭제버튼이 생성됨
                $('#buttonDiv').each(function () {
                    if ($('button', this).length == 2) {
                        $('#buttonDiv').prepend('<button type="button" id="delete" class="btn btn-danger">삭제</button>');
                        cancelEvent();
                    }
                })
                $('#diarySubmit').hide(); //확인버튼숨김
                var schedule_no = event.event.extendedProps.schedule_no//클릭한 이벤트의 스케쥴넘버(DB)
                //ajax로 해당 스케줄의 정보 가져와서 출력
                $.ajax({
                    url: "board_diary_detail.do",
                    type: 'POST',
                    dataType: 'JSON',
                    async: false,
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
                        $('#chtingScheduleNo').val(response.schedule_no);
                        $('#chtingCalLocation').val(response.location);
                        $('#xcoord').val(response.xcoord);
                        $('#ycoord').val(response.ycoord);
                    },
                    error: function (Http, status, error) {
                        console.log(error);
                    }
                });

                calendarModal.show();
                $('#map').empty();

                makeMap();


            },
            //내려놨을때 form불러와서 데이터를 추가로 받는다
            drop: function (info) {
                $('#diarySubmit').show(); //이전에 eventClick으로 hide되었을 경우를 fix

                $('#buttonDiv').each(function () { //취소버튼이 생성되어있다면 지워줌
                    if ($('button', this).length == 3) {
                        $('#buttonDiv').children().first().remove();
                        cancelEvent();
                    }
                })

                calendarModal.show();

                $('#chtingCalType').val(info.draggedEl.innerText);
                $('#chtingCalDate').val(info.dateStr);

                //조기화
                $('#xcoord').val('127.029018585511');
                $('#ycoord').val('37.4994547195947');
                $('#chtingContent').val('');
                $('#chtingSubject').val('');
                $('#chtingCalLocation').val('');

                makeMap();
            },
            eventDrop: function (info) { //이벤트를 옮겼을때 수정함
                var year = (info.event._instance.range.start.getFullYear()); //옮긴 달력의 날짜
                var month = info.event._instance.range.start.getMonth() + 1; //옮긴 달력의 날짜
                var day = info.event._instance.range.start.getDate(); //옮긴 달력의 날짜


                var modifyDate = year + '-' + month + '-' + day;
                var schedule_no = info.event._def.extendedProps.schedule_no;// 옮긴이벤트번호

                $.ajax({
                    url: "board_diary_modify.do",
                    type: 'GET',
                    dataType: 'text',
                    async: false,
                    data: {
                        group_no: '${group_no}',
                        modifyDate: modifyDate,
                        schedule_no: schedule_no
                    },
                    success: function (response) {
                        Swal.fire({
                            position: 'center',
                            icon: 'success',
                            title: '날짜가 변경되었습니다!',
                            showConfirmButton: false,
                            timer: 1500
                        })
                    },
                    error: function (Http, status, error) {
                        console.log(error);
                        Swal.fire({
                            icon: 'error',
                            title: '에러 발생',
                            text: '날짜를 변경할 수 없었습니다',
                            footer: '<a href="#">Chting 관리자에게 문의하기</a>'
                        })
                    }
                });


            }
        });
        calendar.render();
    });

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
                console.log(response);
                return_value = response;
            }
        })
        return return_value;
    }

    function makeMap() { //지도만들기
        $('#map').empty();

        var xcoord = $('#xcoord').val(); //x축 좌표
        var ycoord = $('#ycoord').val(); //y축 좌표
        var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
        var options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(ycoord, xcoord), //지도의 중심좌표.
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
        });

        //div 위치오류 수정 (display : none 이었던 속성때문에 카카오 api가 위치를 제대로 못찾기때문에 재설정을 해줘야한다)
        setTimeout(function () {
            map.relayout();
            map.setCenter(new kakao.maps.LatLng(ycoord, xcoord));
            // map.setLevel(2); 필요하면 레벨조정
        }, 200);

        var iwContent = '<div style="text-align: center; padding-left: 15px">모임장소' +
            '<a href="https://map.kakao.com/link/map/' +
            '모임장소' + ',' + ycoord + ',' + xcoord + '" style="color:#000000" target="_blank">&#127757;</a>' +
            '<a href="https://map.kakao.com/link/to/' +
            '모임장소' + ',' + ycoord + ',' + xcoord + '" style="color:#000000" target="_blank">&#127939;</a></div>',


            iwPosition = new kakao.maps.LatLng(ycoord, xcoord); //인포윈도우 표시 위치입니다


        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            position: iwPosition,
            content: iwContent
        });

        // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
        infowindow.open(map, marker);

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
            } else if (data == null || data == undefined || data == "") { //키워드를 입력안했을시
                Swal.fire({
                    icon: 'error',
                    title: '장소검색 실패!',
                    text: '검색하신 키워드에 대한 정보가 없습니다',
                    footer: 'ex) 강남역 맛집'
                })
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
                $('#chtingCalLocation').val(place.place_name);
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
        if ($("#chtingSubject").val() == "") {
            Swal.fire('일정 제목을 입력해주세요 !')
            return;
        } else if ($("#chtingContent").val().trim() == "") {
            Swal.fire('일정 내용을 입력해주세요 !')
            return;
        } else if ($('#chtingCalLocation').val() == "") {
            Swal.fire("일정 위치를 설정해주세요 !")
            return;
        } else {

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
                    xcoord: $('#xcoord').val(),
                    ycoord: $('#ycoord').val()
                },
                success: function (response) {
                    Swal.fire({
                        title: '일정',
                        text: '일정이 추가되었습니다!'
                    }).then((result) => {
                        //modal팝업 닫기
                        $('.btn-close').click();
                    })
                },
                error: function (Http, status, error) {
                    console.log(error);
                }
            });
        }
    });

    //일정 만들기 취소 클릭이벤트
    function cancelEvent() {
        $('#delete').on('click', function (e) {
            e.preventDefault();
            Swal.fire({
                title: '일정 취소',
                text: '일정을 취소하시겠습니까??',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#A0A0FF',
                cancelButtonColor: '#aaaaaa',
                confirmButtonText: '네',
                cancelButtonText: '아니오'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: "board_diary_delete.do",
                        data: {
                            group_no: '${group_no}',
                            schedule_no: $('#chtingScheduleNo').val()
                        },
                        type: "get",
                        success: function (response) {
                            Swal.fire({
                                title: '일정 삭제',
                                text: '일정이 삭제되었습니다'
                            }).then((result) => {
                                window.location.href = "";
                            })
                        },
                        error: function (Http, status, error) {
                            console.log("Http : " + Http + ", status : " + status + ", error : " + error);
                        }
                    });
                } else {
                    Swal.fire({
                        title: '일정 삭제 취소',
                        text: '삭제를 취소하셨습니다'
                    });
                }
            })

        });
    }
</script>
</html>
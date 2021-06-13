var draggedEventIsAllDay;
var activeInactiveWeekends = true;
var today = new Date();
var calendar = $('#calendar').fullCalendar({

	/** ******************
	  *  OPTIONS
	  * *******************/
	locale: 'ko',
	timezone: "local",
	nextDayThreshold: "09:00:00",
	allDaySlot: true,
	displayEventTime: true,
	displayEventEnd: true,
	firstDay: 0, //월요일이 먼저 오게 하려면 1
	weekNumbers: false,
	selectable: true,
	weekNumberCalculation: "ISO",
	eventLimit: true,
	views: {
		month: { eventLimit: 12 } // 한 날짜에 최대 이벤트 12개, 나머지는 + 처리됨
	},
	eventLimitClick: 'week', //popover
	navLinks: true,
	defaultDate: today, //실제 사용시 현재 날짜로 수정
	timeFormat: 'HH:mm',
	defaultTimedEventDuration: '01:00:00',
	editable: true,
	minTime: '00:00:00',
	maxTime: '24:00:00',
	slotLabelFormat: 'HH:mm',
	weekends: true,
	nowIndicator: true,
	dayPopoverFormat: 'MM/DD dddd',
	longPressDelay: 0,
	eventLongPressDelay: 0,
	selectLongPressDelay: 0,
	header: {
		left: 'today, prevYear, nextYear',
		center: 'prev, title, next',
		right: 'month, agendaWeek, agendaDay'
	},
	views: {
		month: {
			columnFormat: 'dddd'
		},
		agendaWeek: {
			columnFormat: 'M/D ddd',
			titleFormat: 'YYYY년 M월 D일',
			eventLimit: false
		},
		agendaDay: {
			columnFormat: 'dddd',
			eventLimit: false
		},
		listWeek: {
			columnFormat: ''
		}
	},
	eventRender: function(event, element, view) {
		//일정에 hover시 요약
		element.popover({
			title: $('<div />', {
				class: 'popoverTitleCalendar',
				text: event.title
			}).css({
				'background': '#74c0fc',
				'color': '#ffffff'
			}),
			content: $('<div />', {
				class: 'popoverInfoCalendar'
			}).append('<div ><strong>시간:</strong> ' + moment(event.start).format('HH:mm') + '~' + moment(event.end).format('HH:mm') + '</div>').append('<div   class="popoverDescCalendar"><strong>설명:</strong> ' + event.description + '</div>'),
			delay: {
				show: "800",
				hide: "50"
			},
			trigger: 'hover',
			placement: 'top',
			html: true,
			container: 'body'
		});
		return true;
	},

	/* ****************
	 *  일정 받아옴 
	 * ************** */
	events: function(start, end, timezone, callback) {
		$.ajax({
			type: "get",
			url: window.location.href + "event",
			data: {},
			success: function(response) {
				var fixedDate = response.map(function(array) {
					array.end = moment(array.end).add(1, 'days'); // 이틀 이상 AllDay 일정인 경우 달력에 표기시 하루를 더해야 정상출력
					return array;
				});
				callback(fixedDate);
			}
		});
	},

	eventAfterAllRender: function(view) {
		if (view.name == "month") $(".fc-content").css('height', 'auto');
	},

	eventDragStart: function(event, jsEvent, ui, view) {
		draggedEventIsAllDay = event.allDay;
	},

	//일정 드래그앤드롭
	eventDrop: function(event, delta, revertFunc, jsEvent, ui, view) {
		$('.popover.fade.top').remove();

		//주,일 view일때 종일 <-> 시간 변경불가
		if (view.type === 'agendaWeek' || view.type === 'agendaDay') {
			if (draggedEventIsAllDay !== event.allDay) {
				alert('드래그앤드롭으로 종일<->시간 변경은 불가합니다.');
				location.reload();
				return false;
			}
		}

		// 드랍시 수정된 날짜반영
		var newDates = calDateWhenDragnDrop(event);
		console.log(newDates);

		event.startDate = newDates.startDate;
		event.endDate = newDates.endDate;

		var eventData = {
			id: event.id,
			title: event.title,
			startDate: event.startDate,
			endDate: event.endDate,
			description: event.description
		};
		
		console.log(event);
		//드롭한 일정 업데이트
		$.ajax({
			type: "put",
			url: window.location.href + "event",
			contentType: "application/json",
			data: JSON.stringify(eventData),
			success: function(response) {
				alert(response);
				$('#calendar').fullCalendar('refetchEvents');
			},
			error: function(request, status, error) {
				console.log(request + "," + status + "," + error);
			}
		});
	},

	select: function(startDate, endDate, jsEvent, view) {

		$(".fc-body").unbind('click');
		$(".fc-body").on('click', 'td', function(e) {

			$("#contextMenu")
				.addClass("contextOpened")
				.css({
					display: "block",
					left: e.pageX,
					top: e.pageY
				});
			return false;
		});

		var today = moment();

		if (view.name == "month") {
			startDate.set({
				hours: today.hours(),
				minute: today.minutes()
			});
			startDate = moment(startDate).format('YYYY-MM-DD');
			endDate = moment(endDate).subtract(1, 'days');

			endDate.set({
				hours: today.hours() + 1,
				minute: today.minutes()
			});
			endDate = moment(endDate).format('YYYY-MM-DD');
		} else {
			startDate = moment(startDate).format('YYYY-MM-DD');
			endDate = moment(endDate).format('YYYY-MM-DD');
		}

		//날짜 클릭시 카테고리 선택메뉴
		var $contextMenu = $("#contextMenu");
		$contextMenu.on("click", "a", function(e) {
			e.preventDefault();

			//닫기 버튼이 아닐때
			if ($(this).data().role !== 'close') {
				newEvent(startDate, endDate, $(this).html());
			}

			$contextMenu.removeClass("contextOpened");
			$contextMenu.hide();
		});

		$('body').on('click', function() {
			$contextMenu.removeClass("contextOpened");
			$contextMenu.hide();
		});

	},

	//이벤트 클릭시 수정이벤트
	eventClick: function(event, jsEvent, view) {
		editEvent(event);
	}

});

function getDisplayEventDate(event) {

	var displayEventDate;

    var startTimeEventInfo = moment(event.start).format('HH:mm');
    var endTimeEventInfo = moment(event.end).format('HH:mm');
    displayEventDate = startTimeEventInfo + " - " + endTimeEventInfo;
  
	return displayEventDate;
}

function calDateWhenResize(event) {
	console.log(event);
	var newDates = {
		id: event.id,
		startDate: '',
		endDate: ''
	};

	newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
	newDates.endDate = moment(event.end._d).format('YYYY-MM-DD');

	return newDates;
}

function calDateWhenDragnDrop(event) {
	// 드랍시 수정된 날짜반영
	var newDates = {
		startDate: '',
		endDate: ''
	}

	// 날짜 & 시간이 모두 같은 경우
	if (!event.end) {
		event.end = event.start;
	}

	//하루짜리 all day
	if (event.allDay && event.end === event.start) {
		console.log('1111')
		newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
		newDates.endDate = newDates.startDate;
	}

	//2일이상 all day
	else if (event.allDay && event.end !== null) {
		newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
		newDates.endDate = moment(event.end._d).subtract(1, 'days').format('YYYY-MM-DD');
	}

	//all day가 아님
	else if (!event.allDay) {
		newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
		newDates.endDate = moment(event.end._d).subtract(1, 'days').format('YYYY-MM-DD HH');
	}

	return newDates;
}
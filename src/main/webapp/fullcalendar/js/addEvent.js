var eventModal = $('#eventModal');

var modalTitle = $('.modal-title');
var editTitle = $('#edit-title');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editDesc = $('#edit-desc');

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');

/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function(start, end, eventType) {

	$("#contextMenu").hide(); //메뉴 숨김

	modalTitle.html('새로운 일정');
	editTitle.val('');
	editStart.val(start);
	editEnd.val(end);
	editDesc.val('');

	addBtnContainer.show();
	modifyBtnContainer.hide();
	eventModal.modal('show');

	/******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
	var eventId = 1 + Math.floor(Math.random() * 100000);
	/******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/

	//새로운 일정 저장버튼 클릭
	$('#save-event').unbind();
	$('#save-event').on('click', function() {

		var eventData = {
			id: eventId,
			title: editTitle.val(),
			startDate: editStart.val(),
			endDate: editEnd.val(),
			description: editDesc.val(),
		};

		if (eventData.start > eventData.end) {
			alert('끝나는 날짜가 앞설 수 없습니다.');
			return false;
		}

		if (eventData.title === '') {
			alert('일정명은 필수입니다.');
			return false;
		}


		console.log(eventData);

		//새로운 일정 저장
		$.ajax({
			type: "post",
			url: window.location.href + "event",
			contentType: "application/json",
			data: JSON.stringify(eventData),
			success: function(response) {
				alert(response);
				$('#calendar').fullCalendar( 'refetchEvents' );
			},
			error : function(request, status, error) {
				console.log(request + "," + status  + "," + error);
			}
		});
		
		$("#calendar").fullCalendar('renderEvent', eventData, true);
		eventModal.find('input, textarea').val('');
		eventModal.modal('hide');
	});
};
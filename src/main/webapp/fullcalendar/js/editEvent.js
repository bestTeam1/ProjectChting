/* ****************
 *  일정 편집
 * ************** */
var editEvent = function(event, element, view) {

	$('#deleteEvent').data('id', event.id); //클릭한 이벤트 ID

	$('.popover.fade.top').remove();
	$(element).popover("hide");

	if (event.end === null) {
		event.end = event.start;
	}

	if (event.end !== event.start) {
		editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD'))
	} else {
		editEnd.val(event.end.format('YYYY-MM-DD'));
	}

	modalTitle.html('일정 수정');
	editTitle.val(event.title);
	editStart.val(event.start.format('YYYY-MM-DD'));
	editDesc.val(event.description);

	addBtnContainer.hide();
	modifyBtnContainer.show();
	eventModal.modal('show');

	//업데이트 버튼 클릭시
	$('#updateEvent').unbind();
	$('#updateEvent').on('click', function() {

		if (editStart.val() > editEnd.val()) {
			alert('끝나는 날짜가 앞설 수 없습니다.');
			return false;
		}

		if (editTitle.val() === '') {
			alert('일정명은 필수입니다.')
			return false;
		}


		var startDate = moment(editStart.val()).format('YYYY-MM-DD');
		var endDate = moment(editEnd.val()).format('YYYY-MM-DD');
		var displayDate = endDate;

		eventModal.modal('hide');

		var eventData = {
			id: event.id,
			title: editTitle.val(),
			startDate: startDate,
			endDate: displayDate,
			description: editDesc.val()
		}

		$("#calendar").fullCalendar('updateEvent', event);

		//일정 업데이트
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
	});
};

// 삭제버튼
$('#deleteEvent').on('click', function() {
	let data = $(this).data('id');
	$("#calendar").fullCalendar('removeEvents', data);
	eventModal.modal('hide');
	console.log(data);
	//삭제시
	$.ajax({
		type: "delete",
		url: window.location.href + "event/" + data,
		success: function(response) {
			alert(response);
		}
	});

});
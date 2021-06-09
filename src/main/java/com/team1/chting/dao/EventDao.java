package com.team1.chting.dao;

import com.team1.chting.dto.EventDto;

import java.util.List;

public interface EventDao {
    //노출여부가 활성화되어있는 이벤트
	public List<EventDto> enabledEvent();
}

package com.team1.chting.service;

import com.team1.chting.dao.EventDao;
import com.team1.chting.dto.EventDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class EventService {
    @Autowired
    private SqlSession sqlSession;

    public List<EventDto> enabledEvent(){
        EventDao dao = sqlSession.getMapper(EventDao.class);
        List<EventDto> list = new ArrayList<EventDto>();
        list = dao.enabledEvent();

        return list;
    }
}

package com.team1.chting.service;


import com.team1.chting.dao.BoardDao;
import com.team1.chting.dao.GroupDao;
import com.team1.chting.dao.HomeDao;
import com.team1.chting.dto.EventDto;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.PostDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class HomeService {

    @Autowired
    private SqlSession sqlsession;

    /*
    메인 이벤트리스트
    작성자 : 이승준
    작성일 : 2021-06-28
    */
    public List<EventDto> getEventList() {

        HomeDao homeDao = sqlsession.getMapper(HomeDao.class);
        List<EventDto> eventList = homeDao.getEventList();

        return eventList;
    }

    /*
    New 모임 가져오기
    작성자 : 이승준
    작성일 : 2021-06-07
    */
    public List<GroupDto> getNewGroupList() {

        HomeDao homeDao = sqlsession.getMapper(HomeDao.class);
        List<GroupDto> newList = homeDao.getNewGroupList();

        return newList;
    }

    /*
    Best 모임 가져오기
    작성자 : 이승준
    작성일 : 2021-06-07
    */
    public List<GroupDto> getBestGroupList() {

        HomeDao homeDao = sqlsession.getMapper(HomeDao.class);
        List<GroupDto> bestList = homeDao.getBestGroupList();

        return bestList;
    }
}

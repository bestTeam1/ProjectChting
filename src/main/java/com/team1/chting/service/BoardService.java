package com.team1.chting.service;

import com.team1.chting.dao.BoardDao;
import com.team1.chting.dao.GroupDao;
import com.team1.chting.dto.GroupDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

    @Autowired
    private SqlSession sqlsession;

    //New 모임 가져오기
    public List<GroupDto> newGroupList(){

        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        List<GroupDto> newList = boardDao.getNewGroupList();

        return newList;
    }
    //Best 모임 가져오기
    public List<GroupDto> bestGroupList(){

        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        List<GroupDto> bestList = boardDao.getBestGroupList();

        return bestList;
    }

}
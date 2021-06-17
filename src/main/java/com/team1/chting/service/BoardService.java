package com.team1.chting.service;

import com.team1.chting.dao.BoardDao;
import com.team1.chting.dao.GroupDao;
import com.team1.chting.dto.AreaDto;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

    @Autowired
    private SqlSession sqlsession;

    //Area 정보 가져오기
    public List<AreaDto> getAreaList() {

        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        List<AreaDto> areaList = boardDao.getAreaList();

        return areaList;
    }

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

    //Group 검색
    public List<GroupDto> getGroupListBySearch(String category, String search) {

        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        List<GroupDto> groupList = boardDao.getGroupListBySearch(category, search);

        return groupList;
    }

    //Group 관심사
    public List<UserDto> getGroupInterest() {

        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        List<UserDto> groupInterest = boardDao.getGroupInterest();

        return groupInterest;
    }
}

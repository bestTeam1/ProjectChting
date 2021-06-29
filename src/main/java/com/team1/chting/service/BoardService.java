package com.team1.chting.service;

import com.team1.chting.dao.BoardDao;
import com.team1.chting.dao.GroupDao;
import com.team1.chting.dto.*;
import com.team1.chting.utils.AdminCriteria;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.security.acl.Group;
import java.util.List;

@Service
public class BoardService {

    @Autowired
    private SqlSession sqlsession;

    /*
    Area 정보 가져오기
    작성자 : 이승준
    작성일 : 2021-06-07
    */
    public List<AreaDto> getAreaList() {

        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        List<AreaDto> areaList = boardDao.getAreaList();

        return areaList;
    }

    /*
    New 모임 가져오기
    작성자 : 이승준
    작성일 : 2021-06-07
    */
    public List<GroupDto> newGroupList(){

        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        List<GroupDto> newList = boardDao.getNewGroupList();

        return newList;
    }
    /*
    Best 모임 가져오기
    작성자 : 이승준
    작성일 : 2021-06-07
    */
    public List<GroupDto> bestGroupList(){

        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        List<GroupDto> bestList = boardDao.getBestGroupList();

        return bestList;
    }

    /*
    Group 검색
    작성자 : 이승준
    작성일 : 2021-06-07
    */
    public List<GroupDto> getGroupListBySearch(String category, String search, AdminCriteria cri) {

        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        List<GroupDto> groupList = boardDao.getGroupListBySearch(category, search, cri.getPageStart(), cri.getPageSize());

        return groupList;
    }

    public int getGroupListBySearchTotalCount(String category, String search) {
        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        return boardDao.getGroupListBySearchTotalCount(category, search);
    }

    //게시판 리스트 검색
    public List<PostDto> postByGroup_no(String group_no){
        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        List<PostDto> postList = boardDao.postByGroup_no(group_no);

        return postList;
    }

    //Group 관심사
    public List<UserDto> getGroupInterest() {

        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        List<UserDto> groupInterest = boardDao.getGroupInterest();

        return groupInterest;
    }

    public int insertDiary(DiaryDto diaryDto) {

        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        int result = boardDao.insertDiary(diaryDto);
        return result;
    }

    public List<DiaryCalDto> getDiaryList(String group_no) {
        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        List<DiaryCalDto> diaryDtoList = boardDao.getDiaryList(group_no);

        return diaryDtoList;
    }

    public DiaryDto getDiaryDetail(String group_no, String schedule_no) {
        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        DiaryDto diaryDto = boardDao.getDiaryDetail(group_no, schedule_no);

        return diaryDto;
    }

    public void deleteDiary(String group_no, String schedule_no) {
        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        boardDao.deleteDiary(group_no, schedule_no);
    }

    public void modifyDiary(String group_no, String schedule_no, String modifyDate) {
        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        boardDao.modifyDiary(group_no, schedule_no, modifyDate);
    }

}
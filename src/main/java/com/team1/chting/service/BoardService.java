package com.team1.chting.service;

import com.team1.chting.dao.BoardDao;
import com.team1.chting.dao.GroupDao;
import com.team1.chting.dto.AreaDto;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.UserDto;
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

    //모임장으로 있는 모임Number 가져오기
    public GroupDto getAdminGroup(String userid) {

        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        GroupDto group = boardDao.getAdminGroup(userid);
        if(group == null) { //모임장인 모임이 없으면??
            return new GroupDto(); // 빈 GroupDto 리턴
        }
        return group;
    }

    //Group 가입신청 목록 가져오기
    public List<UserDto> getGroupJoinRequest(String groupNo) {

        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        List<UserDto> groupJoinRequest = boardDao.getGroupJoinRequest(groupNo);

        return groupJoinRequest;
    }

    //GroupMember 가져오기
    public List<UserDto> getGroupMemberList(String userid) {
        System.out.println("서비스 userid: " + userid);

        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        List<UserDto> groupMemberList = boardDao.getGroupMemberList(userid);

        return groupMemberList;
    }

    //가입 승인
    @Transactional
    public boolean acceptMembers(List<String> requestList, String groupNo) {
        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);

        try {
            for(int i = 0; i < requestList.size(); i++) {
                boardDao.acceptMember(requestList.get(i),groupNo);
                boardDao.deleteRequest(requestList.get(i),groupNo);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    public boolean deleteRequest(List<String> requestList, String groupNo) {
        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);

        try {
            for(int i = 0; i < requestList.size(); i++) {
                boardDao.deleteRequest(requestList.get(i),groupNo);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    public void banishMembers(List<String> banishList, String groupNo) {
        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);

        try {
            for(int i = 0; i < banishList.size(); i++) {
                boardDao.banishMembers(banishList.get(i),groupNo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


}

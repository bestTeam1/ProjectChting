package com.team1.chting.service;

import com.team1.chting.dao.BoardDao;
import com.team1.chting.dao.GroupDao;
import com.team1.chting.dto.AreaDto;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.PostDto;
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
    public List<GroupDto> getGroupListBySearch(String category, String search) {

        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        List<GroupDto> groupList = boardDao.getGroupListBySearch(category, search);

        return groupList;
    }

    //게시판 리스트 검색
    public List<PostDto> postByGroup_no(String group_no){
        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        List<PostDto> postList = boardDao.postByGroup_no(group_no);

        return postList;
    }

    /*
    모임장으로 있는 모임Number 가져오기
    작성자 : 이승준
    작성일 : 2021-06-08
    */
    public GroupDto getAdminGroup(String userid) {

        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        GroupDto group = boardDao.getAdminGroup(userid);
        if(group == null) { //모임장인 모임이 없으면??
            return new GroupDto(); // 빈 GroupDto 리턴
        }
        return group;
    }

    /*
    Group 가입신청 목록 가져오기
    작성자 : 이승준
    작성일 : 2021-06-09
    */
    public List<UserDto> getGroupJoinRequest(String groupNo) {

        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        List<UserDto> groupJoinRequest = boardDao.getGroupJoinRequest(groupNo);

        return groupJoinRequest;
    }

    /*
    Group 멤버 가져오기
    작성자 : 이승준
    작성일 : 2021-06-09
    */
    public List<UserDto> getGroupMemberList(String userid) {
        System.out.println("서비스 userid: " + userid);

        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        List<UserDto> groupMemberList = boardDao.getGroupMemberList(userid);

        return groupMemberList;
    }

    /*
    가입 승인 Transaction
    작성자 : 이승준
    작성일 : 2021-06-09
    */
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
    /*
    모임가입 거절
    작성자 : 이승준
    작성일 : 2021-06-10
    */
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

    /*
    모임멤버 강퇴
    작성자 : 이승준
    작성일 : 2021-06-11
    */
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

    /*
    모임장 위임
    작성자 : 이승준
    작성일 : 2021-06-12
    */
    public void succeedGroupAdmin(String adminUserid, String requestUserid, String groupNo) {
        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        boardDao.succeedGroupAdmin(adminUserid, requestUserid, groupNo);
    }

    /*
    모임장 위임시 이미 모임장으로 있는 모임이 있는지 체크
    작성자 : 이승준
    작성일 : 2021-06-13
    */
    public boolean duplicateGroupAdminCheck(String userid) {
        BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
        List<UserDto> checkList = boardDao.duplicateGroupAdminCheck(userid);


        for(UserDto dto :checkList) {
            //그룹권한중에 1(Admin)인것이 있으면
            if(dto.getGroup_role_no() == 1){
                System.out.println("it's true!!!!!!!!");
                return true;
            }
        }
        return false;
    }


}
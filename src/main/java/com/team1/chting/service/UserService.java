package com.team1.chting.service;

import com.team1.chting.dao.InterestCategoryDao;
import com.team1.chting.dao.UserDao;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.InterestCategoryDto;
import com.team1.chting.dto.MyPageInfo;
import com.team1.chting.dto.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private SqlSession sqlsession;

    /*
    마이페이지 회원 정보 불러오기
    작성자 : 박주현
    작성일 : 2021-06-07
    */
    // 기본 정보 (아이디, 이름, 소개글, 관심지역, 모임 주인장여부)
    public UserDto userInfoBasic(String userid) {
        UserDao userDao = sqlsession.getMapper(UserDao.class);
        UserDto userDto = userDao.selectUserInfo(userid);

        return userDto;
    }
    // 선택한 관심사 카테고리
    public List<UserDto> userInterest(String userid) {
        UserDao userDao = sqlsession.getMapper(UserDao.class);
        List<UserDto> UserInterestList = userDao.selectUserInterest(userid);

        return UserInterestList;
    }

    // 참여한 모임리스트
    public List<UserDto> userJoinGroup(String userid) {
        UserDao userDao = sqlsession.getMapper(UserDao.class);
        List<UserDto> UserJoinGroupList = userDao.selectUserJoinGroup(userid);

        return UserJoinGroupList;
    }
    //위 3가지 한번에 myPageInfo 에 담기
    public MyPageInfo getMyPageInfo(String userid) {
        MyPageInfo myPageInfo = new MyPageInfo();

        myPageInfo.
                setUserid(userid).
                setUserInfoBasic(userInfoBasic(userid)).
                setUserInterest(userInterest(userid)).
                setUserJoinGroup(userJoinGroup(userid));

        return myPageInfo;
    }

    /*
    회원 탈퇴
    작성자 : 박주현
    작성일 : 2021-06-09
    */
    public void delAcount(String userid) {
        UserDao userDao = sqlsession.getMapper(UserDao.class);
        int result = userDao.deleteAcount(userid);

        if(result > 0){
            System.out.println("회원 탈퇴 성공");
        }else{
            System.out.println("회원 탈퇴 실패");
        }
    }

    /*
    관심사 카테고리 선택하기 (중분류)
    작성자 : 박주현
    작성일 : 2021-06-11
    */
    public List<InterestCategoryDto> getInterestCategory(List<InterestCategoryDto> list) {

        InterestCategoryDao categoryDao = sqlsession.getMapper(InterestCategoryDao.class);
        List<InterestCategoryDto> categoryList = categoryDao.selectInterestCategory(list);

        return categoryList;

    }

    /*
    관심사 카테고리 선택하기 (선택한 관심사 INSERT)
    작성자 : 박주현
    작성일 : 2021-06-17
    */
    public void updateInterestCategory(List<InterestCategoryDto> list) {
        InterestCategoryDao categoryDao = sqlsession.getMapper(InterestCategoryDao.class);

        int result = categoryDao.insertInterestCategory(list);

        if(result > 0){
            System.out.println("관심사 인서트 성공");
        }else{
            System.out.println("관심사 인서트 실패");
        }

    }

    /*
    관심사 카테고리 선택하기 (기존 관심사 DELETE)
    작성자 : 박주현
    작성일 : 2021-06-17
    */
    public void deleteInterestCategory(String userid) {
        InterestCategoryDao categoryDao = sqlsession.getMapper(InterestCategoryDao.class);

        int result = categoryDao.deleteInterestCategory(userid);

        if(result > 0){
            System.out.println("관심사 삭제 성공");
        }else{
            System.out.println("관심사 삭제 실패");
        }
    }


    /*
    회원 정보 수정
    작성자 : 박주현
    작성일 : 2021-06-16
    */
    public void updateUser(UserDto userDto) {
        UserDao userDao = sqlsession.getMapper(UserDao.class);
        int result = userDao.updateUser(userDto);

        if(result > 0){
            System.out.println("정보 수정 성공");
        }else{
            System.out.println("정보 수정 실패");
        }
    }

    /*
    유저 닉네임 정보
    작성자 : 김명환
    작성일 : 2021-06-18
    */
    public String selectNickname(String userid) {
        UserDao userdao = sqlsession.getMapper(UserDao.class);
        String result = userdao.selectNickname(userid);

        return result;
    }

    /*
    모임장인 모임정보 가져오기
    작성자 : 이승준
    작성일 : 2021-06-21
    */
    public GroupDto getAdminGroup(String groupNo) {
        UserDao userDao = sqlsession.getMapper(UserDao.class);
        GroupDto groupDto = userDao.getAdminGroup(groupNo);

        return groupDto;
    }
    /*
    모임원으로 있는 모임정보 가져오기
    작성자 : 이승준
    작성일 : 2021-06-21
    */
    public List<GroupDto> getGroupList(String userid) {
        UserDao userDao = sqlsession.getMapper(UserDao.class);
        List<GroupDto> groupList = userDao.getGroupList(userid);

        return groupList;
    }

    /*
    회원의 지역, 카테고리에 맞는 NEW 모임 리스트
    작성자 : 이승준
    작성일 : 2021-06-22
    */
    public List<GroupDto> getNewGroupByCate(String userid){
        UserDao userDao = sqlsession.getMapper(UserDao.class);
        List<GroupDto> getNewGroupByCate = userDao.getNewGroupByCate(userid);

        return getNewGroupByCate;
    }


    /*
    회원의 지역, 카테고리에 맞는 BEST 모임 리스트
    작성자 : 이승준
    작성일 : 2021-06-22
    */
    public List<GroupDto> getBestGroupByCate(String userid){
        UserDao userDao = sqlsession.getMapper(UserDao.class);
        List<GroupDto> getBestGroupByCate = userDao.getBestGroupByCate(userid);

        return getBestGroupByCate;
    }



}

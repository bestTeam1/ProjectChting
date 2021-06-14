package com.team1.chting.service;

import com.team1.chting.dao.BoardDao;
import com.team1.chting.dao.UserDao;
import com.team1.chting.dto.AreaDto;
import com.team1.chting.dto.InterestCategoryDto;
import com.team1.chting.dto.MyPageInfo;
import com.team1.chting.dto.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public UserDto userInfoBasic() {
        UserDao userDao = sqlsession.getMapper(UserDao.class);
        UserDto userDto = userDao.selectUserInfo();

        return userDto;
    }
    // 선택한 관심사 카테고리
    public List<UserDto> userInterest() {
        UserDao userDao = sqlsession.getMapper(UserDao.class);
        List<UserDto> UserInterestList = userDao.selectUserInterest();

        return UserInterestList;
    }

    // 참여한 모임리스트
    public List<UserDto> userJoinGroup() {
        UserDao userDao = sqlsession.getMapper(UserDao.class);
        List<UserDto> UserJoinGroupList = userDao.selectUserJoinGroup();

        return UserJoinGroupList;
    }
    //위 3가지 한번에 myPageInfo 에 담기
    public MyPageInfo getMyPageInfo() {
        MyPageInfo myPageInfo = new MyPageInfo();

        myPageInfo.
                setUserInfoBasic(userInfoBasic()).
                setUserInterest(userInterest()).
                setUserJoinGroup(userJoinGroup());

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
    관심사 카테고리 선택하기
    작성자 : 박주현
    작성일 : 2021-06-11
    */
    public List<InterestCategoryDto> getInterestCategory(List<InterestCategoryDto> list) {
        UserDao userDao = sqlsession.getMapper(UserDao.class);
        List<InterestCategoryDto> categoryList = userDao.selectInterestCategory(list);


        return categoryList;

    }


}

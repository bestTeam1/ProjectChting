package com.team1.chting.service;

import java.util.ArrayList;
import java.util.List;

import com.team1.chting.dao.BoardDao;
import com.team1.chting.dto.GroupDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import com.team1.chting.dao.UserDao;
import com.team1.chting.dto.UserDto;

@Service
public class UserService {

    @Autowired
    private SqlSession sqlsession;

    /*
    마이페이지 회원 정보 불러오기
    작성자 : 박주현
    작성일 : 2021-06-07
    */
    public UserDto userInfoBasic() {

        UserDao userDao = sqlsession.getMapper(UserDao.class);
        UserDto userDto = userDao.userInfoBasic();

        return userDto;
    }

    public List<UserDto> userInterest() {

        UserDao userDao = sqlsession.getMapper(UserDao.class);
        List<UserDto> UserInterestList = userDao.userInterest();

        return UserInterestList;
    }

    public List<UserDto> userJoinGroup() {

        UserDao userDao = sqlsession.getMapper(UserDao.class);
        List<UserDto> UserJoinGroupList = userDao.userJoinGroup();

        return UserJoinGroupList;
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



}

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

    public List<UserDto> userInfoBasic(){

        UserDao userDao = sqlsession.getMapper(UserDao.class);
        List<UserDto> UserInfoBasicList = userDao.userInfoBasic();

        return UserInfoBasicList;
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
}

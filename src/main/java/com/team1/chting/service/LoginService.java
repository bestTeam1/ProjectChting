package com.team1.chting.service;

import com.team1.chting.dao.LoginDao;
import com.team1.chting.dto.LoginDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired
    private SqlSession sqlSession;


    public LoginDto isUser(String userid) {

        LoginDao loginDao = sqlSession.getMapper(LoginDao.class);
        LoginDto loginDto = loginDao.isUser(userid);

        return loginDto;
    }


}

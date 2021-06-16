package com.team1.chting.service;

import com.team1.chting.dao.LoginDao;
import com.team1.chting.dto.LoginDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class LoginService {

    @Autowired
    private SqlSession sqlSession;

    /*
    DB 회원가입 여부 확인
    작성자 : 김수연
    작성일 : 2021-06-14
    */
    public LoginDto isUser(String userid) {
        LoginDao loginDao = sqlSession.getMapper(LoginDao.class);
        LoginDto loginDto = loginDao.isUser(userid);

        return loginDto;
    }

    public List<Map<String, String>> getAreaList() {
        LoginDao loginDao = sqlSession.getMapper(LoginDao.class);
        List<Map<String, String>> areaList = loginDao.getAreaList();
        return areaList;
    }


}

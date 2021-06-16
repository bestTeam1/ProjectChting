package com.team1.chting.dao;

import com.team1.chting.dto.LoginDto;

import java.util.List;
import java.util.Map;

public interface LoginDao {
    /*
    DB 회원가입 여부 확인
    작성자 : 김수연
    작성일 : 2021-06-14
    */
    public LoginDto isUser(String userid);

    //지역리스트 수연
    public List<Map<String, String>> getAreaList();

}

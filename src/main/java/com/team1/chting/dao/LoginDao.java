package com.team1.chting.dao;

import com.team1.chting.dto.LoginDto;
import com.team1.chting.dto.SignUpDto;

import java.util.HashMap;
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

    //임시 관심사 리스트 수연
    public List<Map<String, String>> tempInterestList();

    //회원가입 수연
    public int insertUser(SignUpDto signUpDto);

    //임시 관심사 넣기 수연
    public int tempInterestInsert(HashMap<String, String> tempInterest);

}

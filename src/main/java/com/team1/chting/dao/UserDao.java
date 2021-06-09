package com.team1.chting.dao;

import java.util.List;

import com.team1.chting.dto.UserDto;

public interface UserDao {

    //회원 기본 정보 (이름, 지역, 소개글)
    List<UserDto> userInfoBasic();

    //회원 관심사 정보
    List<UserDto> userInterest();

    //회원 가입한 모임 정보
    List<UserDto> userJoinGroup();

}

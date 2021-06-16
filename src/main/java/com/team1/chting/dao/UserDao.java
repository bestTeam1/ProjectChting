package com.team1.chting.dao;

import java.util.List;

import com.team1.chting.dto.InterestCategoryDto;
import com.team1.chting.dto.UserDto;

public interface UserDao {

    //회원 기본 정보 (이름, 지역, 소개글, 모임장여부)
    UserDto selectUserInfo();

    //회원 관심사 정보
    List<UserDto> selectUserInterest();

    //회원 가입한 모임 정보
    List<UserDto> selectUserJoinGroup();

    //회원 탈퇴
    int deleteAcount(String userid);

    //관심사 선택
    List<InterestCategoryDto> selectInterestCategory(List<InterestCategoryDto> list);

    //회원 정보 수정
    int updateUser(UserDto userDto);
}

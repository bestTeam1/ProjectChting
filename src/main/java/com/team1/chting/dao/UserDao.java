package com.team1.chting.dao;

import java.util.List;

import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.UserDto;
import org.apache.ibatis.annotations.Param;

public interface UserDao {

    //회원 기본 정보 (이름, 지역, 소개글, 모임장여부)
    UserDto selectUserInfo(String userid);

    //회원 관심사 정보
    List<UserDto> selectUserInterest(String userid);

    //회원 가입한 모임 정보
    List<UserDto> selectUserJoinGroup(String userid);

    //회원 탈퇴
    int deleteAcount(String userid);

    //회원 정보 수정
    int updateUser(UserDto userDto);

    //userid 로 유저의 nickname 정보
    String selectNickname(String userid);

    //userid 로 유저의 지역정보
    UserDto selectAreacode(String userid);

    //모임장그룹정보 가져오기
    public GroupDto getAdminGroup(@Param("groupNo") String groupNo);

    //모임원으로 있는 그룹정보 가져오기
    public List<GroupDto> getGroupList(@Param("userid") String userid);

    //회원의 지역, 카테고리에 맞는 NEW 모임 리스트
    public List<GroupDto> getNewGroupByCate(@Param("userid") String userid);

    //회원의 지역, 카테고리에 맞는 BEST 모임 리스트
    public List<GroupDto> getBestGroupByCate(@Param("userid") String userid);

    //가입한 모든 모임 가져오기
    List<GroupDto> getGroupListAll(String userid);
}

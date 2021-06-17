package com.team1.chting.dao;

import com.team1.chting.dto.AreaDto;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.UserDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BoardDao {

    //지역정보
    public List<AreaDto> getAreaList();

    //NEW 추천 모임
    public List<GroupDto> getNewGroupList();

    //BEST 추천 모임
    public List<GroupDto> getBestGroupList();

    //모임검색
    public List<GroupDto> getGroupListBySearch(@Param("category") String category,@Param("search") String search);

    //모임멤버 정보
    public List<GroupDto> getGroupMemberList();

    //모임만들기 관심사 정보
    public List<UserDto> getGroupInterest();
}
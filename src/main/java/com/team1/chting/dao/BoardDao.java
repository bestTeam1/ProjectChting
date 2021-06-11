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

    //모임장으로 있는 모임 가져오기
    public GroupDto getAdminGroup(@Param("userid") String userid);

    //모임가입신청 정보
    public List<UserDto> getGroupJoinRequest(@Param("groupNo") String groupNo);

    //모임멤버 정보
    public List<UserDto> getGroupMemberList(@Param("userid") String userid);

    //멤버 가입승인
    public void acceptMember(@Param("requestId") String requestId, @Param("groupNo") String groupNo);

    //가입신청 삭제(가입승인or 가입거절 이후)
    public void deleteRequest(@Param("requestId") String requestId, @Param("groupNo") String groupNo);

    //멤버 강퇴
    public void banishMembers(@Param("requestId") String requestId, @Param("groupNo") String groupNo);

}
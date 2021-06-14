package com.team1.chting.dao;

import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.UserDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GroupAdminDao {

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

    //모임장권한위임
    public void succeedGroupAdmin(@Param("adminUserid") String adminUserid,
                                  @Param("requestUserid") String requestUserid,
                                  @Param("groupNo") String groupNo);

    //모임장 위임시 이미 모임장인 모임이 있는지 체크
    public List<UserDto> duplicateGroupAdminCheck(@Param("userid") String userid);

    //모임 해산 part 1 : 모임 멤버 모두 강퇴
    public void groupDisbandMembers(@Param("groupNo") String groupNo);

    //모임 해산 part 1 : 모임 enabled 0
    public void groupDisbandEnabled(@Param("groupNo") String groupNo);

    //자신이 모임장으로 있는 모임의 이름
    public GroupDto getAdminGroupName(@Param("groupNo") String groupNo);

}

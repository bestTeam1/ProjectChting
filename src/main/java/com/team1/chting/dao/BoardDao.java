package com.team1.chting.dao;

import com.team1.chting.dto.AreaDto;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.PostDto;
import com.team1.chting.dto.UserDto;
import com.team1.chting.utils.AdminCriteria;
import com.team1.chting.utils.Criteria;
import org.apache.ibatis.annotations.Param;


import java.util.List;

public interface BoardDao {

    //지역정보
    public List<AreaDto> getAreaList();

    //NEW 추천 모임
    public List<GroupDto> getNewGroupList();

    //BEST 추천 모임
    public List<GroupDto> getBestGroupList();

    //게시판페이지 -> 그룹넘버를 이용한 검색
    public List<PostDto> postByGroup_no(String Group_no);

    //모임검색
    public List<GroupDto> getGroupListBySearch(@Param("category") String category, @Param("search") String search,
                                               @Param("pageStart") int pageStart, @Param("pageSize")int pageSize);

    //모임검색 토탈 개수 getGroupListBySearchTotalCount
    public int getGroupListBySearchTotalCount(@Param("category") String category, @Param("search") String search);

    //모임만들기 관심사 정보
    public List<UserDto> getGroupInterest();
}

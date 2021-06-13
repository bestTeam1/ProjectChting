package com.team1.chting.dao;

import com.team1.chting.dto.AreaDto;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.PostDto;

import java.util.List;

public interface BoardDao {

    //지역정보
    public List<AreaDto> getAreaList();

    //NEW 추천 모임
    public List<GroupDto> getNewGroupList();

    //BEST 추천 모임
    public List<GroupDto> getBestGroupList();

    //모임검색
    public List<GroupDto> getGroupListBySearch(String category, String search);

    //게시판페이지 -> 그룹넘버를 이용한 검색
    public List<PostDto> postByGroup_no(String Group_no);
}
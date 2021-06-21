package com.team1.chting.dao;

import com.team1.chting.dto.GroupDto;

import java.util.List;

public interface HomeDao {

    //NEW 추천 모임
    public List<GroupDto> getNewGroupList();

    //BEST 추천 모임
    public List<GroupDto> getBestGroupList();
}

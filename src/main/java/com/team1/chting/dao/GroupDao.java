package com.team1.chting.dao;

import com.team1.chting.dto.GroupDto;

import com.team1.chting.dto.PostDto;

import com.team1.chting.utils.Criteria;
import org.apache.ibatis.annotations.Param;


import java.util.List;
import java.util.Map;

public interface GroupDao {
    // 게시글 작성
    public void postWirte(PostDto postDto);

    // 게시글 상세보기
    public GroupDto read(String group_no);

    // 게시글 수정
    public void update(GroupDto gdto);

    // 게시글 삭제
    public void delete(String group_no);

    // 게시글 전체 목록
    public List<PostDto> getPostList();

    // 페이징 리스트?
    public List<Map<String, Object>> postList(Criteria cri);


    //비회원 -> 랜덤모임 10개
    public List<GroupDto> randomGroup();

    //회원 -> 지역기반 5개
    public List<GroupDto> areaGroup(@Param("first_area") String first_area,@Param("second_area") String second_area);

    //회원 -> 관심사기반 5개
    public List<GroupDto> catecodeGroup(String userid);
}

package com.team1.chting.dao;

import com.team1.chting.dto.GroupDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GroupDao {
    // 게시글 작성
    // 게시글 상세보기
    // 게시글 수정
    // 게시글 삭제
    // 게시글 전체 목록

    public void wirte(GroupDto gdto);
    public GroupDto read(String group_no);
    public void update(GroupDto gdto);
    public void delete(String group_no);
    public List<GroupDto> listAll();


    //비회원 -> 랜덤모임 10개
    public List<GroupDto> randomGroup();

    //회원 -> 지역기반 5개
    public List<GroupDto> areaGroup(@Param("first_area") String first_area,@Param("second_area") String second_area);

    //회원 -> 관심사기반 5개
    public List<GroupDto> catecodeGroup(String userid);
}

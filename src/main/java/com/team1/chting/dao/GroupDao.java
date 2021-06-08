package com.team1.chting.dao;

import com.team1.chting.dto.GroupDto;

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

}

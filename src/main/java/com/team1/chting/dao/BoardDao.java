package com.team1.chting.dao;

import com.team1.chting.dto.*;
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
    public List<GroupDto> getGroupListBySearch(@Param("category") String category,@Param("search") String search);

    //모임만들기 관심사 정보
    public List<UserDto> getGroupInterest();

    //일정추가
    public int insertDiary(DiaryDto diaryDto);

    //일정 목록 불러오기
    public List<DiaryCalDto> getDiaryList(@Param("group_no") String group_no);

    //일정 상세보기
    public DiaryDto getDiaryDetail(@Param("group_no")String group_no, @Param("schedule_no") String schedule_no);

    //일정 삭제하기
    public void deleteDiary(@Param("group_no")String group_no, @Param("schedule_no") String schedule_no);

    //일정 수정하기
    public void modifyDiary(@Param("group_no")String group_no, @Param("schedule_no") String schedule_no, @Param("modifyDate") String modifyDate);
}

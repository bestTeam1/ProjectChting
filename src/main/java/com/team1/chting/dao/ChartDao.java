package com.team1.chting.dao;

import com.team1.chting.dto.chartdto.ChartJoinTypeDto;
import com.team1.chting.dto.chartdto.ChartMainDto;
import com.team1.chting.dto.chartdto.ChartRatioDto;
import com.team1.chting.dto.chartdto.ChartRecentUserDto;
import org.apache.ibatis.annotations.Param;

import java.util.Date;

public interface ChartDao {
    //차트데이터 성비 가져오기
    public ChartRatioDto getRatio();

    //차트데이터 최근 7일 총 유저수 가져오기
    public ChartRecentUserDto getRecentUser(@Param("now") String now);

    //차트데이터 회원가입 유형 데이터 가져오기
    public ChartJoinTypeDto getChartJoinType();

    //총 회원수
    public int getTotalUser();

    //총 모임수
    public int getTotalGroup();

    //총 이벤트
    public int getTotalEvent();

    //가장많은 모임 관심사 수
    public int getTotalInterest();

    //가장많은 관심사 이름름
   public String getTopInterest();


}

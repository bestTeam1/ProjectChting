package com.team1.chting.dao;

import com.team1.chting.dto.chartdto.ChartRatioDto;
import com.team1.chting.dto.chartdto.ChartRecentUserDto;
import org.apache.ibatis.annotations.Param;

import java.util.Date;

public interface ChartDao {
    //차트데이터 성비 가져오기
    public ChartRatioDto getRatio();

    //차트데이터 최근 7일 총 유저수 가져오기
    public ChartRecentUserDto getRecentUser(@Param("now") String now);
}

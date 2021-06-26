package com.team1.chting.service;

import com.team1.chting.dao.ChartDao;
import com.team1.chting.dto.chartdto.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class ChartService {
    @Autowired
    private SqlSession sqlSession;

    //성비 가져오기
    public ChartRatioDto getRatio() {
        ChartDao chartDao = sqlSession.getMapper(ChartDao.class);

        return chartDao.getRatio();
    }

    public ChartRecentUserDto getRecentUser() {
        ChartDao chartDao = sqlSession.getMapper(ChartDao.class);

        SimpleDateFormat today = new SimpleDateFormat( "yyyy-MM-dd");

        Date time = new Date();

        String now = today.format(time);

        return chartDao.getRecentUser(now);
    }

    //차트데이터 회원가입 유형 데이터 가져오기
    public ChartJoinTypeDto getChartJoinType() {
        ChartDao chartDao = sqlSession.getMapper(ChartDao.class);
        return chartDao.getChartJoinType();

    }
    //차트데이터 회원가입 유형 데이터 가져오기
    public ChartMainDto getChartMainDto() {
        ChartDao chartDao = sqlSession.getMapper(ChartDao.class);
        ChartMainDto chartMainDto = new ChartMainDto();

        chartMainDto.setTotalUser(chartDao.getTotalUser());
        chartMainDto.setTotalGroup(chartDao.getTotalGroup());
        chartMainDto.setTotalEvent(chartDao.getTotalEvent());
        chartMainDto.setTotalInterest(chartDao.getTotalInterest());
        chartMainDto.setTopInterest(chartDao.getTopInterest());

        return chartMainDto;

    }
    //모임 관심사별 회원수
    public ChartInterestDto getChartGroupTypes() {
        ChartDao chartDao = sqlSession.getMapper(ChartDao.class);

        return chartDao.getChartGroupTypes();
    }
    //모임 일정 위치 데이터
    public List<ChartScheduleDto> getChartSchedule() {
        ChartDao chartDao = sqlSession.getMapper(ChartDao.class);

        return chartDao.getChartSchedule();
    }

}

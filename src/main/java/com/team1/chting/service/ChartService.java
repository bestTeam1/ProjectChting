package com.team1.chting.service;

import com.team1.chting.dao.ChartDao;
import com.team1.chting.dto.chartdto.ChartRatioDto;
import com.team1.chting.dto.chartdto.ChartRecentUserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.text.SimpleDateFormat;

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

}

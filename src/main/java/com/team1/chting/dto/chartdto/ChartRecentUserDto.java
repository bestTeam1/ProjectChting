package com.team1.chting.dto.chartdto;

import lombok.Data;

//차트데이터 최근 7일 총 유저수 Dto
@Data
public class ChartRecentUserDto {
    private int sixDaysAgo;
    private int fiveDaysAgo;
    private int fourDaysAgo;
    private int threeDaysAgo;
    private int twoDaysAgo;
    private int yesterday;
    private int today;
}

package com.team1.chting.dto.chartdto;

import lombok.Data;

//차트데이터 모임일정 마커. 카카오의 api 데이터에 맞게 가공
@Data
public class ChartScheduleDto {
    private String title;
    private String xcoord;
    private String ycoord;

}

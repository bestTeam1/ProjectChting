package com.team1.chting.dto.chartdto;

import lombok.Data;

//차트데이터 대시보드 메인에 들어갈 정보들
@Data
public class ChartMainDto {
    private int totalUser;         //가입자 수
    private int totalGroup;         //모임 수
    private int totalEvent;         //총 이벤트 수
    private int totalInterest;     //가장있기있는 관심사의 모임수
    private String topInterest;  //가장인기있는 관심사
}

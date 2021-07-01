package com.team1.chting.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.team1.chting.dto.chartdto.*;
import com.team1.chting.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;


@RestController
public class ChartRestController {

    @Autowired
    private ChartService chartService;

    /*
    차트데이터 성비 가져오기 Ajax
    작성자 : 이승준
    작성일 : 2021-06-24
    */

    @RequestMapping(value = "chartRatio.do", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> chartRatio() {

        ChartRatioDto chartRatioDto = chartService.getRatio();

        ObjectMapper objmap = new ObjectMapper();

        try {
            String result = objmap.writeValueAsString(chartRatioDto);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("", HttpStatus.BAD_GATEWAY);
        }

    }
    /*
    차트데이터 최근 7일 총 유저수 가져오기 Ajax
    작성자 : 이승준
    작성일 : 2021-06-24
    */

    @RequestMapping(value = "chartRecentUser.do", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> ChartRecentUser() {

        ChartRecentUserDto chartRecentUserDto = chartService.getRecentUser();

        ObjectMapper objmap = new ObjectMapper();

        try {
            String result = objmap.writeValueAsString(chartRecentUserDto);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("", HttpStatus.BAD_GATEWAY);
        }

    }
    /*
    작성자 : 이승준
    작성일 : 2021-06-24
     차트데이터 회원가입 유형 데이터 가져오기
    */

    @RequestMapping(value = "chartJoinType.do", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> ChartJoinType() {

        ChartJoinTypeDto chartJoinType = chartService.getChartJoinType();

        ObjectMapper objmap = new ObjectMapper();

        try {
            String result = objmap.writeValueAsString(chartJoinType);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("", HttpStatus.BAD_GATEWAY);
        }

    }

    /*
    작성자 : 이승준
    작성일 : 2021-06-26
    차트데이터 대시보드 상단 요약정보 가져오기
    */
    @RequestMapping(value = "dashboardInfo.do", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> dashboardInfo() {

        ChartMainDto chartMainDto = chartService.getChartMainDto();

        ObjectMapper objmap = new ObjectMapper();

        try {
            String result = objmap.writeValueAsString(chartMainDto);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("", HttpStatus.BAD_GATEWAY);
        }

    }

    /*
    작성자 : 이승준
    작성일 : 2021-06-26
    차트데이터 유형별 모임수 가져오기
     */
    @RequestMapping(value = "chartGroupTypes.do", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> chartGroupTypes() {

        ChartInterestDto chart = chartService.getChartGroupTypes();

        //System.out.println(chart);

        ObjectMapper objmap = new ObjectMapper();

        try {
            String result = objmap.writeValueAsString(chart);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("", HttpStatus.BAD_GATEWAY);
        }

    }

    /*
    작성자 : 이승준
    작성일 : 2021-06-26
    카카오맵 모임 마커
     */
    @RequestMapping(value = "chartSchedule.do", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> chartGroupSchedule() {

        List<ChartScheduleDto> chart = chartService.getChartSchedule();

        ObjectMapper objmap = new ObjectMapper();

        try {
            String result = objmap.writeValueAsString(chart);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("", HttpStatus.BAD_GATEWAY);
        }

    }
}

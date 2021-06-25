package com.team1.chting.controller;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.team1.chting.dto.chartdto.ChartJoinTypeDto;
import com.team1.chting.dto.chartdto.ChartMainDto;
import com.team1.chting.dto.chartdto.ChartRatioDto;
import com.team1.chting.dto.chartdto.ChartRecentUserDto;
import com.team1.chting.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class ChartRestController {

    @Autowired
    private ChartService chartService;

    //차트데이터 성비 가져오기 Ajax
    @RequestMapping(value = "chartRatio.do", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> chartRatio() {

        ChartRatioDto chartRatioDto = chartService.getRatio();

        ObjectMapper objmap = new ObjectMapper();

        try {
            String result = objmap.writeValueAsString(chartRatioDto);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch(Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("", HttpStatus.BAD_GATEWAY);
        }

    }

    //차트데이터 최근 7일 총 유저수 가져오기 Ajax
    @RequestMapping(value = "chartRecentUser.do", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> ChartRecentUser() {

        ChartRecentUserDto chartRecentUserDto = chartService.getRecentUser();

        ObjectMapper objmap = new ObjectMapper();

        try {
            String result = objmap.writeValueAsString(chartRecentUserDto);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch(Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("", HttpStatus.BAD_GATEWAY);
        }

    }

    //차트데이터 회원가입 유형 데이터 가져오기
    @RequestMapping(value = "chartJoinType.do", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> ChartJoinType() {

        ChartJoinTypeDto chartJoinType = chartService.getChartJoinType();

        ObjectMapper objmap = new ObjectMapper();

        try {
            String result = objmap.writeValueAsString(chartJoinType);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch(Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("", HttpStatus.BAD_GATEWAY);
        }

    }

    //차트데이터 회원가입 유형 데이터 가져오기
    @RequestMapping(value = "dashboardInfo.do", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> dashboardInfo() {

        ChartMainDto chartMainDto = chartService.getChartMainDto();

        ObjectMapper objmap = new ObjectMapper();

        try {
            String result = objmap.writeValueAsString(chartMainDto);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch(Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("", HttpStatus.BAD_GATEWAY);
        }

    }
}

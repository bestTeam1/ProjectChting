package com.team1.chting.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.service.GroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class AjaxRestController {
    @Autowired
    private GroupService groupService;

    @RequestMapping(value="/main/nologin", method= RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> randomGroup(){
        List<GroupDto> list = null;
        ObjectMapper objmap = new ObjectMapper();
        String result = "";
        try {
            list = groupService.randomGroup();
            for(GroupDto dto : list) {
                System.out.println(dto.toString());
            }
            result = objmap.writeValueAsString(list);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch(Exception e){
            System.out.println(e.getMessage());
            return new ResponseEntity<String>(result, HttpStatus.BAD_GATEWAY);
        }
    }

}

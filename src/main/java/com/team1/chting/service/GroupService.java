package com.team1.chting.service;

import com.team1.chting.dao.GroupDao;
import com.team1.chting.dto.GroupDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GroupService {

    @Autowired
    private SqlSession sqlsession;

//    @Override
//    public List<GroupDto> listAll() throws Exception{
//        return sqlsession.selectList("board.listAll");
//    }

    public List<GroupDto> listAll() throws Exception{
        return sqlsession.selectList("board.listAll");
    }

}

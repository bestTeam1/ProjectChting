package com.team1.chting.service;

import com.team1.chting.dao.GroupDao;
import com.team1.chting.dto.GroupDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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

    public List<GroupDto> randomGroup() {
        List<GroupDto> list = new ArrayList<GroupDto>();
        GroupDao dao = sqlsession.getMapper(GroupDao.class);
        list = dao.randomGroup();
        return list;
    }

    public List<GroupDto> areaGroup(String first_area, String second_area) {
        List<GroupDto> list = new ArrayList<GroupDto>();
        GroupDao dao = sqlsession.getMapper(GroupDao.class);
        list = dao.areaGroup(first_area,second_area);
        return list;
    }

    public List<GroupDto> catecodeGroup(String userid) {
        List<GroupDto> list = new ArrayList<GroupDto>();
        GroupDao dao = sqlsession.getMapper(GroupDao.class);
        list = dao.catecodeGroup(userid);
        return list;
    }

    public List<GroupDto> userGroupList(String userid) {
        List<GroupDto> list = new ArrayList<GroupDto>();
        GroupDao dao = sqlsession.getMapper(GroupDao.class);
        list = dao.userGroupList(userid);
        return list;
    }

    public GroupDto groupByGroup_no(String group_no) {
        GroupDao dao = sqlsession.getMapper(GroupDao.class);
        GroupDto dto = dao.groupByGroup_no(group_no);
        return dto;
    }
}

package com.team1.chting.service;


import com.team1.chting.dao.GroupDao;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.PostDto;
import com.team1.chting.utils.AdminCriteria;
import com.team1.chting.utils.Criteria;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class GroupService {

    @Autowired
    private SqlSession sqlsession;

//    @Override
//    public List<GroupDto> listAll() throws Exception{
//        return sqlsession.selectList("board.listAll");
//    }

    // 내가가입한모임 - 게시글 리스트
    public List<PostDto> getPostList(String group_no, AdminCriteria cri){
        List<PostDto> postlist = new ArrayList<PostDto>();
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        postlist = groupDao.getPostList(group_no, cri.getPageStart(), cri.getPageSize());
        return postlist;
    }
    // 게시글 리스트 카운트 수연
    public int getPostListTotalCount(String group_no, AdminCriteria cri){
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        return groupDao.getPostListTotalCount(group_no, cri.getPageStart(), cri.getPageSize());
    }


    // 게시판 글쓰기
    public void insert(PostDto postDto){
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        groupDao.insert(postDto);
    }

    // 게시판 상세보기
    public PostDto read(int post_no){
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        groupDao.read(post_no);

        return read(post_no);
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

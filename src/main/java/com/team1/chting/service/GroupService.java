package com.team1.chting.service;


import com.team1.chting.dao.AdminDao;
import com.team1.chting.dao.BoardDao;
import com.team1.chting.dao.GroupDao;
import com.team1.chting.dao.UserDao;
import com.team1.chting.dto.*;
import com.team1.chting.utils.Criteria;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
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
    public List<PostDto> getPostList(String group_no) {
        List<PostDto> postlist = new ArrayList<PostDto>();
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        postlist = groupDao.getPostList(group_no);
        return postlist;
    }


    // 게시판 글쓰기
    public void insert(PostDto postDto) {
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        groupDao.insert(postDto);
    }

    // 게시판 상세보기
    public PostDto read(int post_no) {
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
        list = dao.areaGroup(first_area, second_area);
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


    /*
      모임 생성
      작성자 : 박주현
      작성일 : 2021-06-20
    */
    public void groupMake(GroupDto groupDto, HttpServletRequest request, String groupNo) throws Exception {

        if(groupDto.getFileName() != null) {
            CommonsMultipartFile file = groupDto.getFileName();
            if(file != null && file.getSize() > 0 && !file.isEmpty()) {
                String fileName = file.getOriginalFilename();
                System.out.println(fileName);
                fileName = groupNo + "." + fileName.split("\\.")[1]; //프로필이미지 이름 = group_name
                String path = request.getSession().getServletContext().getRealPath("/upload/groupimg");
                String fpath = path + File.separator + fileName;

                if(!fileName.equals("")) {
                    FileOutputStream fs = new FileOutputStream(fpath);
                    fs.write(file.getBytes());
                    fs.close();
                }
                groupDto.setGroup_img(fileName);
            }
        }
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        groupDao.insertGroup(groupDto);

    }

    /*
      최근 생선된 모임 정보
      작성자 : 박주현
      작성일 : 2021-06-20
    */
    public GroupDto groupBefore() {
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        GroupDto groupDto = groupDao.selectGroup();

        return groupDto;
    }


    public String selectGroupRoleNo(String userid, String group_no) {
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        String result = groupDao.selectGroupRoleNo(userid, group_no);

        return result;
    }

    public int insertGroupJoinRequest(JoinRequestDto dto){
        int result = 0;
        try {
            GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
            result = groupDao.insertGroupJoinRequest(dto);
            return result;
        } catch(DataIntegrityViolationException e) {
            result = -1;
            return result;
        } catch(Exception e) {
            return result;
        }
    }

    public int deleteGroupUserRole(GroupUserRoleDto dto) {
        int result = 0;
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        result = groupDao.deleteGroupUserRole(dto);

        return result;
    }

}


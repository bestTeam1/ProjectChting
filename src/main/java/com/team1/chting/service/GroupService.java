package com.team1.chting.service;


import com.team1.chting.dao.GroupDao;
import com.team1.chting.dto.*;
import com.team1.chting.dto.PostCategoryDto;
import com.team1.chting.utils.AdminCriteria;
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

@Service
public class GroupService {

    @Autowired
    private SqlSession sqlsession;


    public boolean checkMember(String group_no, String userid) {
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        int result = groupDao.checkMember(group_no, userid);

        //조회결과있으면 모임원or모임장
        if (result > 0) {
            return true;
        } else { //아니면 false
            return false;
        }

    }

    /*
      게시판CRUD
      작성자 : 현상진
      작성일 : 2021-06-18
    */

    public List<PostDto> listCriPost(AdminCriteria cri) throws Exception {
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        return groupDao.listPageCriPost(cri);
    }

    public int pageCount() throws Exception {
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        return groupDao.pageCount();
    }

    // 내가가입한모임 - 게시글 리스트
//    public List<PostDto> getPostList(String group_no) {
//        List<PostDto> postlist = new ArrayList<PostDto>();
//        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
//        postlist = groupDao.getPostList(group_no);
//        return postlist;
//    }
    public List<PostDto> getPostList(String group_no, int page) throws Exception {
        if (page <= 0) {
            page = 1;
        }
        page = (page - 1) * 10;

        System.out.println("------------------");
        System.out.println(group_no);
        System.out.println(page);

        List<PostDto> postlist = new ArrayList<PostDto>();
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        postlist = groupDao.getPostList(group_no, page);
        return postlist;
    }

    public List<PostDto> listPageCriPost(AdminCriteria cri) throws Exception {
        return sqlsession.selectList("listPageCriPost", cri);
    }

    public int pageCountPost(String group_no) throws Exception {
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        return groupDao.pageCountPost(group_no);

    }


    // 게시판 글쓰기
    public void insert(PostDto postDto, HttpServletRequest httpServletRequest, CommonsMultipartFile file) throws Exception {
        GroupDao dao = sqlsession.getMapper(GroupDao.class);
        dao.insert(postDto);
        if (file != null && file.getSize() > 0 && !file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            fileName = postDto.getPost_no() + "." + fileName.split("\\.")[1].toLowerCase();
            ;
            String path = httpServletRequest.getSession().getServletContext().getRealPath("/upload/boardimg");
            String fpath = path + File.separator + fileName;

            if (!fileName.equals("")) {
                FileOutputStream fs = new FileOutputStream(fpath);
                fs.write(file.getBytes());
                fs.close();
            }
            dao.insertFile(fileName, postDto.getPost_no() + "");

        }
    }

    // 게시판 상세보기
    public PostDto read(int post_no) {
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        // groupDao.read(post_no);
        PostDto postDto = groupDao.read(post_no);

        return postDto;
    }

    // 수정하기
    public boolean updateOk(PostDto dto, CommonsMultipartFile file, HttpServletRequest httpServletRequest) throws Exception {
        if (file != null && file.getSize() > 0 && !file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            String path = httpServletRequest.getSession().getServletContext().getRealPath("/upload/boardimg");
            String fpath = path + File.separator + fileName;

            if (!fileName.equals("")) {
                FileOutputStream fs = new FileOutputStream(fpath);
                fs.write(file.getBytes());
                fs.close();
            }
            dto.setFile(fileName);
        }
        System.out.println(dto.toString());

        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        int u = groupDao.update(dto);

        if (u > 0) {
            return true;
        } else {
            return false;
        }
    }

    // 삭제하기
    public void delete(int post_no) {
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        groupDao.delete(post_no);
    }

    public List<GroupDto> randomGroup() {
        List<GroupDto> list = new ArrayList<GroupDto>();
        GroupDao dao = sqlsession.getMapper(GroupDao.class);
        list = dao.randomGroup();
        return list;
    }

    public List<GroupDto> areaGroup(String userid) {
        List<GroupDto> list = new ArrayList<GroupDto>();
        GroupDao dao = sqlsession.getMapper(GroupDao.class);
        list = dao.areaGroup(userid);
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

    public GroupDto groupByGroup_no(String groupNo) {
        GroupDao dao = sqlsession.getMapper(GroupDao.class);
        GroupDto dto = dao.groupByGroup_no(groupNo);
        return dto;
    }

    /*
       댓글
       작성자 : 현상진
       작성일 : 2021-06-21
     */
    // 댓글 등록
    public int replyWrite(PostReplyDto postReplyDto) {
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        return groupDao.replyWrite(postReplyDto);
    }

    // 댓글 목록
    public List<PostReplyDto> getReply(int post_no) {
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        List<PostReplyDto> result = groupDao.getReply(post_no);
        return result;
    }

    // 댓글 삭제
    public int replyDelete(int reply_no) {
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        return groupDao.replyDelete(reply_no);
    }

    // 댓글 수정
    public void replyUpdate(PostReplyDto postReplyDto) {
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        groupDao.replyUpdate(postReplyDto);
    }


    /*
      모임 생성
      작성자 : 박주현
      작성일 : 2021-06-20
    */
    public void groupMake(GroupDto groupDto, HttpServletRequest request, String groupNo) throws Exception {
        if (groupDto.getFileName() != null) {
            CommonsMultipartFile file = groupDto.getFileName();
            if (file != null && file.getSize() > 0 && !file.isEmpty()) {
                String fileName = file.getOriginalFilename();
                System.out.println(fileName);
                fileName = groupNo + "." + fileName.split("\\.")[1].toLowerCase(); //프로필이미지 이름 = group_name
                String path = request.getSession().getServletContext().getRealPath("/upload/groupimg");
                String fpath = path + File.separator + fileName;

                if (!fileName.equals("")) {
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

    public int insertGroupJoinRequest(JoinRequestDto dto) {
        int result = 0;
        try {
            GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
            result = groupDao.insertGroupJoinRequest(dto);
            System.out.println(result);
            return result;
        } catch (DataIntegrityViolationException e) {
            result = -1;
            System.out.println(e.getMessage());
            return result;
        } catch (Exception e) {
            System.out.println(result);
            return result;
        }
    }

    public int deleteGroupUserRole(GroupUserRoleDto dto) {
        int result = 0;
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        result = groupDao.deleteGroupUserRole(dto);

        return result;
    }


    public List<PostCategoryDto> getPostCategory() {

        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        List<PostCategoryDto> postCategoryList = groupDao.selectPostCategory();

        return postCategoryList;
    }
}





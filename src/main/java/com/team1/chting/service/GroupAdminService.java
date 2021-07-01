package com.team1.chting.service;

import com.team1.chting.dao.GroupAdminDao;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

@Service
public class GroupAdminService {

    @Autowired
    private SqlSession sqlsession;

    /*
    모임장으로 있는 모임Number 가져오기
    작성자 : 이승준
    작성일 : 2021-06-08
    */
    public GroupDto getAdminGroup(String userid) {

        GroupAdminDao groupAdminDao = sqlsession.getMapper(GroupAdminDao.class);
        GroupDto group = groupAdminDao.getAdminGroup(userid);

        if (group == null) { //모임장인 모임이 없으면??
            return new GroupDto(); // 빈 GroupDto 리턴
        }
        return group;
    }

    /*
    Group 가입신청 목록 가져오기
    작성자 : 이승준
    작성일 : 2021-06-09
    */
    public List<UserDto> getGroupJoinRequest(String groupNo) {

        GroupAdminDao groupAdminDao = sqlsession.getMapper(GroupAdminDao.class);
        List<UserDto> groupJoinRequest = groupAdminDao.getGroupJoinRequest(groupNo);

        return groupJoinRequest;
    }

    /*
    Group 멤버 가져오기
    작성자 : 이승준
    작성일 : 2021-06-09
    */
    public List<UserDto> getGroupMemberList(String userid) {

        GroupAdminDao groupAdminDao = sqlsession.getMapper(GroupAdminDao.class);
        List<UserDto> groupMemberList = groupAdminDao.getGroupMemberList(userid);

        return groupMemberList;
    }

    /*
    가입 승인 Transaction
    작성자 : 이승준
    작성일 : 2021-06-09
    */
    @Transactional
    public boolean acceptMembers(List<String> requestList, String groupNo) {
        GroupAdminDao groupAdminDao = sqlsession.getMapper(GroupAdminDao.class);

        try {
            for (int i = 0; i < requestList.size(); i++) {
                groupAdminDao.acceptMember(requestList.get(i), groupNo);
                groupAdminDao.deleteRequest(requestList.get(i), groupNo);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    /*
    모임가입 거절
    작성자 : 이승준
    작성일 : 2021-06-10
    */
    public boolean deleteRequest(List<String> requestList, String groupNo) {
        GroupAdminDao groupAdminDao = sqlsession.getMapper(GroupAdminDao.class);

        try {
            for (int i = 0; i < requestList.size(); i++) {
                groupAdminDao.deleteRequest(requestList.get(i), groupNo);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    /*
    모임멤버 강퇴
    작성자 : 이승준
    작성일 : 2021-06-11
    */
    public void banishMembers(List<String> banishList, String groupNo) {
        GroupAdminDao groupAdminDao = sqlsession.getMapper(GroupAdminDao.class);

        try {
            for (int i = 0; i < banishList.size(); i++) {
                groupAdminDao.banishMembers(banishList.get(i), groupNo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /*
    모임장 위임
    작성자 : 이승준
    작성일 : 2021-06-12
    */
    public void succeedGroupAdmin(String adminUserid, String requestUserid, String groupNo) {
        GroupAdminDao groupAdminDao = sqlsession.getMapper(GroupAdminDao.class);
        groupAdminDao.succeedGroupAdmin(adminUserid, requestUserid, groupNo);
    }


    /*
    모임장 위임시 이미 모임장으로 있는 모임이 있는지 체크
    작성자 : 이승준
    작성일 : 2021-06-13
    */
    public boolean duplicateGroupAdminCheck(String userid) {
        GroupAdminDao groupAdminDao = sqlsession.getMapper(GroupAdminDao.class);
        List<UserDto> checkList = groupAdminDao.duplicateGroupAdminCheck(userid);


        for (UserDto dto : checkList) {
            //그룹권한중에 1(Admin)인것이 있으면
            if (dto.getGroup_role_no() == 1) {
                //System.out.println("it's true!!!!!!!!");
                return true;
            }
        }
        return false;
    }

    /*
    자신이 모임장으로 있는 모임의 이름
    작성자 : 이승준
    작성일 : 2021-06-14
    */
    public GroupDto getAdminGroupName(String groupNo) {
        GroupAdminDao groupAdminDao = sqlsession.getMapper(GroupAdminDao.class);
        GroupDto groupDto = groupAdminDao.getAdminGroupName(groupNo);

        return groupDto;
    }

    /*
     자신이 모임장으로 있는 모임 해산
     작성자 : 이승준
     작성일 : 2021-06-14
    */
    @Transactional
    public void groupDisbandOk(String groupNo) {
        GroupAdminDao groupAdminDao = sqlsession.getMapper(GroupAdminDao.class);
        groupAdminDao.groupDisbandMembers(groupNo);
        groupAdminDao.groupDisbandEnabled(groupNo);
    }

    /*
     모임 정보 가져오기
     작성자 : 박주현
     작성일 : 2021-06-23
    */
    public GroupDto getGroupInfo(String groupNo) {

        GroupAdminDao groupAdminDao = sqlsession.getMapper(GroupAdminDao.class);
        GroupDto groupDto = groupAdminDao.selectGroupInfo(groupNo);

        return groupDto;
    }

    /*
     모임 정보 수정하기
     작성자 : 박주현
     작성일 : 2021-06-23
    */
    public void updateGroup(GroupDto groupDto, HttpServletRequest request) throws Exception {
        if (groupDto.getFileName() != null) {
            CommonsMultipartFile file = groupDto.getFileName();
            if (file != null && file.getSize() > 0 && !file.isEmpty()) {
                String fileName = file.getOriginalFilename();
                //System.out.println(fileName);
                fileName = groupDto.getGroup_no() + "." + fileName.split("\\.")[1].toLowerCase(); //프로필이미지 이름 = group_name
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
        GroupAdminDao groupAdminDao = sqlsession.getMapper(GroupAdminDao.class);
        groupAdminDao.updateGroup(groupDto);

    }

    /*
     모임 참여 회원 수
     작성자 : 박주현
     작성일 : 2021-06-23
    */
    public int getJoinUser(String groupNo) {
        GroupAdminDao groupAdminDao = sqlsession.getMapper(GroupAdminDao.class);
        int result = groupAdminDao.selectJoinUser(groupNo);

        return result;
    }
}
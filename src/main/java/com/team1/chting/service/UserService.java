package com.team1.chting.service;

import com.team1.chting.dao.GroupDao;
import com.team1.chting.dao.InterestCategoryDao;
import com.team1.chting.dao.UserDao;
import com.team1.chting.dto.InterestCategoryDto;
import com.team1.chting.dto.MyPageInfo;
import com.team1.chting.dto.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Locale;

@Service
public class UserService {

    @Autowired
    private SqlSession sqlsession;

    /*
    마이페이지 회원 정보 불러오기
    작성자 : 박주현
    작성일 : 2021-06-07
    */
    // 기본 정보 (아이디, 이름, 소개글, 관심지역, 모임 주인장여부)
    public UserDto userInfoBasic(String userid) {
        UserDao userDao = sqlsession.getMapper(UserDao.class);
        UserDto userDto = userDao.selectUserInfo(userid);

        return userDto;
    }

    // 선택한 관심사 카테고리
    public List<UserDto> userInterest(String userid) {
        UserDao userDao = sqlsession.getMapper(UserDao.class);
        List<UserDto> UserInterestList = userDao.selectUserInterest(userid);

        return UserInterestList;
    }

    // 참여한 모임리스트
    public List<UserDto> userJoinGroup(String userid) {
        UserDao userDao = sqlsession.getMapper(UserDao.class);
        List<UserDto> UserJoinGroupList = userDao.selectUserJoinGroup(userid);

        return UserJoinGroupList;
    }

    //위 3가지 한번에 myPageInfo 에 담기
    public MyPageInfo getMyPageInfo(String userid) {
        MyPageInfo myPageInfo = new MyPageInfo();

        myPageInfo.
                setUserid(userid).
                setUserInfoBasic(userInfoBasic(userid)).
                setUserInterest(userInterest(userid)).
                setUserJoinGroup(userJoinGroup(userid));

        return myPageInfo;
    }

    /*
    회원 탈퇴
    작성자 : 박주현
    작성일 : 2021-06-09
    */
    public void delAcount(String userid) {
        UserDao userDao = sqlsession.getMapper(UserDao.class);
        int result = userDao.deleteAcount(userid);

        if (result > 0) {
            System.out.println("회원 탈퇴 성공");
        }else {
            System.out.println("회원 탈퇴 실패");
        }
    }

    /*
    관심사 카테고리 선택하기
    작성자 : 박주현
    작성일 : 2021-06-11
    */
    public List<InterestCategoryDto> getInterestCategory() {

        InterestCategoryDao categoryDao = sqlsession.getMapper(InterestCategoryDao.class);
        List<InterestCategoryDto> categoryList = categoryDao.selectInterestCategory();

        return categoryList;

    }

    /*
    관심사 카테고리 선택하기 (기존 관심사 DELETE / 선택한 관심사 INSERT)
    작성자 : 박주현
    작성일 : 2021-06-17
    */
    @Transactional
    public void updateInterestCategory(List<InterestCategoryDto> list, String userid) {
        InterestCategoryDao categoryDao = sqlsession.getMapper(InterestCategoryDao.class);

        try {
            categoryDao.deleteInterestCategory(userid);
            categoryDao.insertInterestCategory(list);
        }catch (Exception e) {
            System.out.println(" [!] User InterestCategory Transaction Error :: " + e.getMessage());
            throw e;
        }

    }

    /*
    회원 정보 수정
    작성자 : 박주현
    작성일 : 2021-06-16
    */
    public void updateUser(UserDto userDto, HttpServletRequest request) throws Exception  {

        if(userDto.getFileName() != null) {
            CommonsMultipartFile file = userDto.getFileName();
            if(file != null && file.getSize() > 0 && !file.isEmpty()) {
                String fileName = file.getOriginalFilename();
                //프로필이미지 이름 = userid.확장자
                fileName = userDto.getUserid() + "." + fileName.split("\\.")[1].toLowerCase();
                String path = request.getSession().getServletContext().getRealPath("/upload/profileimg");
                String fpath = path + File.separator + fileName;

                if(!fileName.equals("")) {
                    FileOutputStream fs = new FileOutputStream(fpath);
                    fs.write(file.getBytes());
                    fs.close();
                }
                userDto.setProfile_img(fileName);
            }
        }
        UserDao userDao = sqlsession.getMapper(UserDao.class);
        userDao.updateUser(userDto);
    }

    /*
    유저 닉네임 정보
    작성자 : 김명환
    작성일 : 2021-06-18
    */
    public String selectNickname(String userid) {
        UserDao userdao = sqlsession.getMapper(UserDao.class);
        String result = userdao.selectNickname(userid);

        return result;
    }

    /*
    유저 닉네임 정보
    작성자 : 김명환
    작성일 : 2021-06-18
    */
    public UserDto selectAreacode(String userid) {
        UserDao userdao = sqlsession.getMapper(UserDao.class);
        UserDto result = userdao.selectAreacode(userid);

        return result;
    }
}

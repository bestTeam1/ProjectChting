package com.team1.chting.service;

import com.team1.chting.dao.InterestCategoryDao;
import com.team1.chting.dao.LoginDao;
import com.team1.chting.dto.InterestCategoryDto;
import com.team1.chting.dto.LoginDto;
import com.team1.chting.dto.SignUpDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class LoginService {

    @Autowired
    private SqlSession sqlSession;

    /*
    DB 회원가입 여부 확인
    작성자 : 김수연
    작성일 : 2021-06-14
    */
    public LoginDto isUser(String userid) {
        LoginDao loginDao = sqlSession.getMapper(LoginDao.class);
        LoginDto loginDto = loginDao.isUser(userid);

        return loginDto;
    }

    //회원가입 페이지 지역정보 리스트 가져오기 수연
    public List<Map<String, String>> getAreaList() {
        LoginDao loginDao = sqlSession.getMapper(LoginDao.class);
        List<Map<String, String>> areaList = loginDao.getAreaList();
        return areaList;
    }

    //회원가입 페이지 임시 관심사 리스트 가져오기 수연
    public List<Map<String, String>> tempInterestList() {
        LoginDao loginDao = sqlSession.getMapper(LoginDao.class);
        List<Map<String, String>> interestList = loginDao.tempInterestList();
        return interestList;
    }

    @Transactional
    public int signUpReg(SignUpDto signUpDto, HttpServletRequest request, List<String> interest) throws Exception {
        int result1 = 0;
        int result2 = 0;
        if (signUpDto.getFileName() != null) {
            CommonsMultipartFile file = signUpDto.getFileName();
            if (file != null && file.getSize() > 0 && !file.isEmpty()) {
                String fileName = file.getOriginalFilename();
                //프로필이미지 이름 = userid.확장자
                fileName = signUpDto.getUserid() + "." + fileName.split("\\.")[1].toLowerCase();
                String path = request.getSession().getServletContext().getRealPath("/upload/profileimg");
                String fpath = path + File.separator + fileName;

                if (!fileName.equals("")) {
                    FileOutputStream fs = new FileOutputStream(fpath);
                    fs.write(file.getBytes());
                    fs.close();
                }
                signUpDto.setProfile_img(fileName);
            }
        }
        List<InterestCategoryDto> list = new ArrayList<>();
        for (String inter : interest) {
            InterestCategoryDto interestCategoryDto = new InterestCategoryDto();
            interestCategoryDto.setCatecode(inter);
            interestCategoryDto.setUserid(signUpDto.getUserid());
            list.add(interestCategoryDto);
        }

        LoginDao loginDao = sqlSession.getMapper(LoginDao.class);
        InterestCategoryDao interestDao = sqlSession.getMapper(InterestCategoryDao.class);
        try {
            result1 = loginDao.insertUser(signUpDto);
            result2 = interestDao.insertInterestCategory(list);
        } catch (Exception e) {
            System.out.println(" [!] Transaction Error :: " + e.getMessage());
            throw e;
        }
        return result1 + result2;
    }


}

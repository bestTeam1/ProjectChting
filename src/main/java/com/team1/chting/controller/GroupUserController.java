package com.team1.chting.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.PostDto;
import com.team1.chting.service.GroupService;
import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
public class GroupUserController {

    @Autowired
    private GroupService groupservice;
    @Autowired
    private SqlSession sqlsession;

    // 메인
    @RequestMapping(value = "board_main.do", method = RequestMethod.GET)
    public String groupMain(@RequestParam("group_no") String group_no, Model model){
        GroupDto dto = groupservice.groupByGroup_no(group_no);
        model.addAttribute("group",dto);
        return "board/board_main";
    }

    // 게시물 리스트
    @RequestMapping(value = "board_list.do", method = RequestMethod.GET)
    public String postList(@RequestParam("group_no") String group_no, Model model){
        // 전체 글 개수
        List<PostDto> postList = groupservice.getPostList(group_no);

        model.addAttribute("postList", postList);
        model.addAttribute("group_no", group_no);
        return "board/board_list";
    }



    //글쓰기
    @RequestMapping(value = "board_write.do", method = RequestMethod.GET)
    public String groupWrite(@RequestParam("group_no") String group_no, Model model){
        model.addAttribute("group_no", group_no);
        return "board/board_write";
    }

    // 글쓰기 post
    @RequestMapping(value = "board_write.do", method = RequestMethod.POST)
    public String insert (PostDto postDto) {

       groupservice.insert(postDto);
       String group_no = postDto.getGroup_no();

       // 파일업로드 처리
//        String file=null;
//        String uploadFile = postDto.getFile();
//        if(!uploadFile.isEmpty()){
//            String originalFileName = uploadFile.getOriginalFilename();
//            String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
//            UUID uuid = UUID.randomUUID(); //UUID 구하기
//            file=uuid+"."+ext;
//            uploadFile.transferTo(new File("String fpath = path + File.separator + filename"));
//
//        }
//        postDto.setFile(file);
//        groupservice.insert(postDto);

        return "redirect:board_list.do?group_no=" + group_no;
    }

    // 글 상세보기
//    @RequestMapping(value = "board_detail.do", method = RequestMethod.GET)
//    public String read (@RequestParam(value = "post_no", required = false) int post_no, Model model){
////        PostDto postDto = groupservice.read(post_no);
////        System.out.println(postDto);
////        model.addAttribute("post", postDto );
//
//        return "board/board_detail";
//    }

    // 글 상세보기
    @RequestMapping(value = "board_detail.do", method = RequestMethod.GET)
    public String read(@RequestParam("post_no") int post_no, Model model){
        PostDto postDto = groupservice.read(post_no);

        model.addAttribute("plist", postDto);
        return "board/board_detail";
    }

    // 글 삭제하기
    @RequestMapping(value = "board_delete.do", method = RequestMethod.GET)
    public String delete(@RequestParam("post_no") int post_no, Model model){
        groupservice.delete(post_no);
        return "board/board_list";
    }

    // 글 수정하기
    @RequestMapping(value = "board_update.do", method = RequestMethod.GET)
    public String update(@RequestParam("post_no")int post_no, Model model){
        PostDto postDto = groupservice.read(post_no);

        model.addAttribute("plist", postDto);

        return "board/board_update";
    }

    // 글 수정 post
    @RequestMapping(value = "board_updateOk.do", method = RequestMethod.POST)
    public String updateOk(HttpServletRequest httpServletRequest, Model model){
        int post_no = Integer.parseInt(httpServletRequest.getParameter("post_no"));
        String subject = httpServletRequest.getParameter("subject");
        String content = httpServletRequest.getParameter("content");
        String file = httpServletRequest.getParameter("file");

        boolean u = groupservice.updateOk(post_no, subject, content, file);

        if (u != true){
            System.out.println("게시판 수정 실패");
        }
        return "redirect:board_detail.do?post_no=" + post_no;
    }

    // 일정
    @RequestMapping(value = "board_diary.do", method = RequestMethod.GET)
    public String groupDiary(@RequestParam("group_no") String group_no, Model model){

        return "board/board_diary";
}

    // 채팅
    @RequestMapping(value = "board_chatting.do", method = RequestMethod.GET)
    public String groupChatting(@RequestParam("group_no") String group_no, Model model){

        return "board/board_chatting";
    }

}
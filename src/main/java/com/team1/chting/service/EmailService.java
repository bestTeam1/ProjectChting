package com.team1.chting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.apache.velocity.app.VelocityEngine;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.HashMap;
import java.util.Map;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private VelocityEngine velocityEngine;

    public void sendMail(String email, String userid) {
        try {
            Map<String, String> model = new HashMap<String, String>();
            MimeMessage msg = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");

            model.put("userid", userid);

            String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "email.vm", "UTF-8", model);

            // 이메일 수신자
            helper.setTo(new InternetAddress(email));

            // 이메일 발신자
            helper.setFrom(new InternetAddress("team1bit196@gmail.com", "취팅"));

            // 이메일 제목
            helper.setSubject("취팅 회원가입을 축하드립니다!");

            // 이메일 본문
            helper.setText(text, true);

            // 이메일 보내기
            mailSender.send(msg);
            //System.out.println("메일 전송 성공");
        } catch (Exception e) {
            //System.out.println("메일 전송 실패");
            System.out.println(e.getMessage());
        }
    }
}

package com.GDEG.myapp.Service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.GDEG.myapp.DAO.mDAO;
import com.GDEG.myapp.DTO.memberDTO;


@Service
public class MService {
	ModelAndView mav = new ModelAndView();
	
	@Autowired
	mDAO mdao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	BCryptPasswordEncoder pwEnc;
	
//	회원가입
	public ModelAndView join(memberDTO member) throws IllegalStateException, IOException {
		
		
		MultipartFile file = member.getFile();// 실제로 업로드 된 파일
		
		
		
		
		String fileName = file.getOriginalFilename();// 파일이 업로드 될 경우(첨부파일 선택할 경우)
	
	
//		MultipartFile : enctype 파일을 가져오기 위해 사용
//		getOriginalFilename : 파일이름만 가져옴
		
		String savePath ="D:/js/mySpringFile/3M/webapp/resources/fileUpload/"+fileName;
		
		if(!file.isEmpty()) {
			file.transferTo(new File (savePath));
		}
		
		if(fileName.equals("")) {
			fileName = "NOIMG.jpg";
		}
		member.setFilename(fileName);

		int result = mdao.join(member);
	
		if(result > 0) {
			mav.setViewName("main");
		}
		
		return mav;
	}

//	로그인
	public ModelAndView login(memberDTO member) {
		String encPw = mdao.memberEncPw(member.getId());
		String loginId = mdao.memberlogin(member.getId());
		memberDTO mmember = mdao.memberinfo(member.getId());
		if(pwEnc.matches(member.getPw(), encPw)) {
			session.setAttribute("member", mmember);
			session.setAttribute("loginId", loginId);
			mav.setViewName("main");
		}
		return mav;
	}

//	회원 정보 수정
	public ModelAndView mProcess(memberDTO member) throws IllegalStateException, IOException {
	
		MultipartFile file = member.getFile();// 실제로 업로드 된 파일
		
		
		
		
		String fileName = file.getOriginalFilename();// 파일이 업로드 될 경우(첨부파일 선택할 경우)
	
	
//		MultipartFile : enctype 파일을 가져오기 위해 사용
//		getOriginalFilename : 파일이름만 가져옴
		
		String savePath ="D:/js/mySpringFile/3M/webapp/resources/fileUpload/"+fileName;
		
		if(!file.isEmpty()) {
			file.transferTo(new File (savePath));
		}
		
		member.setFilename(fileName);
		
	
		
		int result = mdao.process(member);
		

		
		 memberDTO loginId = mdao.proView(member.getId()); 
		
		if(result > 0) {
			mav.setViewName("main");
			session.setAttribute("member", loginId);
		}
		
		return mav;
	}

	public memberDTO memberView(String id) {
		memberDTO mdto = mdao.memberView(id);
	
		return mdto;
	}

	public memberDTO test(String id) {
		memberDTO mdto = mdao.test(id);
		return mdto;
	}

	public memberDTO memberList(String id) {
		
		memberDTO mdto = mdao.memberList(id);
		return mdto;
	}
}

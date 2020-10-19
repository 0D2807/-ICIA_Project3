package com.GDEG.myapp.Controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.GDEG.myapp.DTO.memberDTO;
import com.GDEG.myapp.Service.MService;

@Controller
public class MController {
	
	ModelAndView mav = new ModelAndView();
	
	@Autowired
	MService msvc = new MService();
	@Autowired
	HttpSession session;
	
	
	
	  // 회원가입
	  @RequestMapping(value = "/join", method = RequestMethod.POST) 
	  public ModelAndView join(@ModelAttribute memberDTO member) throws IllegalStateException, IOException { 
		mav = msvc.join(member); 
		
      return mav; 
	  }
	  
	  // 로그인
	  @RequestMapping(value = "/login", method = RequestMethod.POST) 
	  public ModelAndView login(@ModelAttribute memberDTO member) { 
		  System.out.println("========================================================================");
			System.out.println("Controller");
		    System.out.println("member : " + member);
			System.out.println("========================================================================");
		mav = msvc.login(member); 
	  
	   return mav; 
	  }
	  
	  // 로그아웃
	  @RequestMapping(value = "/logout") 
	  public String logout() {
	  session.invalidate();
	 
	  return "main"; 
	  }
	  
//		회원정보수정
		@RequestMapping(value ="/process", method = RequestMethod.POST)
		public ModelAndView process(@ModelAttribute memberDTO member) throws IllegalStateException, IOException {
			
			mav = msvc.mProcess(member);
			
			return mav;
			
		}
	 
}

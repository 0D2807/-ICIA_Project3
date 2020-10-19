package com.GDEG.myapp.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import com.GDEG.myapp.DTO.FeedDTO;
import com.GDEG.myapp.DTO.FollowerDTO;
import com.GDEG.myapp.DTO.boardDTO;
import com.GDEG.myapp.DTO.likeDTO;
import com.GDEG.myapp.DTO.memberDTO;
import com.GDEG.myapp.Service.FeedService;
@Controller

public class TController {
	
	private ModelAndView mav = new ModelAndView();
	@Autowired
	private FeedService fdsvc;
	@Autowired
	HttpSession session;
	// 피드 페이지(feed), 피드 상세보기 실행, 팔로우 목록
	@RequestMapping(value = "/feed")
	public ModelAndView feed() throws IllegalStateException,IOException{
		mav = fdsvc.getView();
		return mav;
	}
	
	// 피드작성(feedWriterFrom)
	@RequestMapping(value = "feedWriterFrom", method = RequestMethod.POST)
	public ModelAndView feedWriterFrom(@ModelAttribute FeedDTO feed) throws IllegalStateException,IOException{
		System.out.println("컨트롤러"+feed);
		mav = fdsvc.feedWriterFile(feed);
		return mav;
	}
	
	// 피드 수정
	@RequestMapping(value ="Process", method = RequestMethod.POST)
	public ModelAndView ModifyProcess(@ModelAttribute FeedDTO feed) throws IllegalStateException, IOException {
		System.out.println("ctnl");
		mav = fdsvc.ModifyProcess(feed);
		return mav;
	}
	
	// 피드 삭제
	@RequestMapping(value ="FeedDelete")
	public ModelAndView FeedDelete(@RequestParam int Fnum, String id){
		mav = fdsvc.FeedDelete(Fnum, id);
		return mav;
	}
	

	 
	

}

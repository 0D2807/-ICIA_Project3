package com.GDEG.myapp.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.GDEG.myapp.DTO.FeedDTO;
import com.GDEG.myapp.DTO.FollowerDTO;
import com.GDEG.myapp.DTO.boardDTO;
import com.GDEG.myapp.DTO.memberDTO;
import com.GDEG.myapp.DTO.reportDTO;
import com.GDEG.myapp.Service.SService;

@Controller
@RequestMapping("/board/*")
public class ajaxController {
	ModelAndView mav = new ModelAndView();

	@Autowired
	private SService svc;

	List<boardDTO> boardList = new ArrayList<boardDTO>();
	
	// comment/commentList로 보내준 경우만 받아온다.
	@RequestMapping(value = "/boardList")
	public @ResponseBody List<boardDTO> boardList() {
		boardList = svc.boardList();
		return boardList;
	}
	
	@RequestMapping(value = "/boardHealthList")
	public @ResponseBody List<boardDTO> boardHealthList() {
		boardList = svc.boardHealthList();
		return boardList;
	}
	
	@RequestMapping(value = "/boardFitnessList")
	public @ResponseBody List<boardDTO> boardFitnessList() {
		boardList = svc.boardFitnessList();
		return boardList;
	}
	@RequestMapping(value = "/boardView")
	public @ResponseBody boardDTO boardView(@RequestParam(value = "num") int num) {
		boardDTO board = svc.boardView(num);
		return board;
	}
	
	@RequestMapping(value = "/reportList")
	public @ResponseBody List<reportDTO> reportList() {
		List<reportDTO> reportList = new ArrayList<reportDTO>();
		reportList = svc.reportList();
		return reportList;
	}
	
	@RequestMapping(value = "/getView")
	public @ResponseBody memberDTO getView(@RequestParam(value = "getid") String id) {
		memberDTO member = svc.getView(id);
		return member;
	}
	
	// 팔로우 목록
	@RequestMapping(value = "/followView")
	public @ResponseBody List<FollowerDTO> followView(@RequestParam(value = "id") String id) {
		List<FollowerDTO> follower= svc.followView(id);
		return follower;
	}
	
	// 팔로우 피드 목록
	@RequestMapping(value = "/allFollowView")
	public @ResponseBody List<FeedDTO> allFollowView(@RequestParam(value = "id") String id) {
		List<FeedDTO> follower= svc.allFollowView(id);
		return follower;
	}
	
	@RequestMapping(value = "/boardDelete")
	public @ResponseBody void boardDelete(@RequestParam(value = "num") int num) {
		svc.boardDelete(num);
	}
}

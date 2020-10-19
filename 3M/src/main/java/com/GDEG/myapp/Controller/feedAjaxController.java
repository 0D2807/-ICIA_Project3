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
import com.GDEG.myapp.DTO.likeDTO;
import com.GDEG.myapp.Service.FeedService;
import com.GDEG.myapp.Service.SService;

@Controller
@RequestMapping("/feed/*")
public class feedAjaxController {
	
	ModelAndView mav = new ModelAndView();
	
	@Autowired
	private FeedService fsvc;
	@Autowired
	private SService svc;
	
	List<FeedDTO> feed = new ArrayList<FeedDTO>();
	
	List<FollowerDTO> follower = new ArrayList<FollowerDTO>();
	
	@RequestMapping(value = "/lastFeed")
	public @ResponseBody List<FeedDTO> lastFeed(@RequestParam(value = "id") String id) {
		 feed = svc.lastFeed(id);
		 
		return feed;
	}
	
	@RequestMapping(value = "/myFeed")
	public @ResponseBody List<FeedDTO> myFeed(@RequestParam(value = "id") String id) {
		 feed = svc.myFeed(id);
		return feed;
	}
	@RequestMapping(value = "/allFeedView")
	public @ResponseBody List<FeedDTO> allFeedView() {
		 feed = svc.allFeedView();
		return feed;
	}
	@RequestMapping(value = "/followerFeedView")
	public @ResponseBody List<FollowerDTO> followerFeed(@RequestParam(value = "id") String id) {
		follower = svc.followerFeed(id);
		return follower;
	}
	@RequestMapping(value = "/followerFeed")
	public @ResponseBody List<FeedDTO> followerFeedView(@RequestParam(value = "id") String id) {

		feed = svc.followerFeedView(id);
		return feed;
	}
	@RequestMapping(value = "/feedSearch")
	public @ResponseBody List<FeedDTO> feedSearch(@RequestParam(value = "key") String key) {
		
		
		feed = svc.feedSearch(key);
		
		return feed;
	}
//	좋아요
	 @RequestMapping(value ="feedlike") 
	 public @ResponseBody void feedlike(@ModelAttribute likeDTO like){ 
		 System.out.println("Con_like : " + like);
		 fsvc.feedlike(like); 
		 
	
		 }
}
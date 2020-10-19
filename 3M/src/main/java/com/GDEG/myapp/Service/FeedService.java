package com.GDEG.myapp.Service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.GDEG.myapp.DAO.FollowerDAO;
import com.GDEG.myapp.DAO.feedDAO;
import com.GDEG.myapp.DAO.likeDAO;

import com.GDEG.myapp.DAO.mDAO;
import com.GDEG.myapp.DAO.memberDAO;
import com.GDEG.myapp.DTO.FeedDTO;
import com.GDEG.myapp.DTO.FollowerDTO;
import com.GDEG.myapp.DTO.likeDTO;
import com.GDEG.myapp.DTO.memberDTO;
@Service
public class FeedService {
	ModelAndView mav = new ModelAndView();

	@Autowired
	private feedDAO fdao;

	@Autowired
	private likeDAO lidao;
	
	@Autowired
	private memberDAO cdao;
	@Autowired
	HttpSession session;
	
	// 피드 작성
	public ModelAndView feedWriterFile(FeedDTO feed) throws IllegalStateException,IOException {
		MultipartFile ffile = feed.getFile();
		String fileName = ffile.getOriginalFilename();
		String savePath ="C:/Users/1/Documents/workspace-spring-tool-suite-4-4.7.1.RELEASE/3M/webapp/resources/fileUpload/"+fileName;
		
		if(!ffile.isEmpty()) {
			ffile.transferTo(new File(savePath));
		}
		feed.setFilename(fileName);
		int writerResult = fdao.feedWriterFile(feed);
		if(writerResult > 0) {
			mav.setViewName("redirect:/feed");
			mav.addObject("id", feed.getFid());
		} else {
			mav.setViewName("feed");
		}
		return mav;
	}
	
	// 피드상세보기 , 회원 프로필, 팔로우 보기
	public ModelAndView getView() {
		String id = (String)session.getAttribute("loginId");
		
		FeedDTO feedmodify = fdao.feedmodify(id);
		// 피드목록
		List<FeedDTO> MyFeedList = fdao.myFeed(id);
		System.out.println("MyFeedList : " + MyFeedList);
		// 전체 피드
		List<FeedDTO> feed = fdao.allFeedView();
		System.out.println("feed : " + feed);
		// 트레이너 정보
		List<memberDTO> trainer = cdao.trasiner(id);
		System.out.println("trainer : " + trainer);
		if(feed != null) {
			mav.addObject("feeds", feed);
			mav.addObject("MyFeedList",MyFeedList);
			mav.addObject("trainer",trainer);
			mav.addObject("feedmodify", feedmodify);
			mav.setViewName("feed");
		}
		return mav;
	}
	
	// 피드 수정
	public ModelAndView ModifyProcess(FeedDTO feed) throws IllegalStateException, IOException {
		System.out.println("feed : " + feed);
		MultipartFile bfile = feed.getFile();
		String fileName = bfile.getOriginalFilename();
		String savePath = "C:/Users/1/Documents/workspace-spring-tool-suite-4-4.7.1.RELEASE/3M/webapp/resources/fileUpload/" + fileName;

		if (!bfile.isEmpty()) {
			bfile.transferTo(new File(savePath));
		}
		feed.setFilename(fileName);

		int modifyResult = fdao.modifyProcess(feed);

		if (modifyResult > 0) {
			mav.setViewName("redirect:/feed?Fnum="+feed.getFnum());
		}

		return mav;
	}

	public ModelAndView FeedDelete(int fnum, String id) {
		int delete = fdao.FeedDelete(fnum);
		if(delete>0){
			mav.setViewName("redirect:/feed");
			mav.addObject("id", id);
		}
		return mav;
	}

	
	 public void feedlike(likeDTO like) { 

		 
		likeDTO likecheck= lidao.feedlikecheck(like); 
		 if(likecheck==null) { 
			  lidao.like(like); 
			 
		} else { 
			 lidao.unlike(like); 
				
		}
	  
		 
	  }
	 




}

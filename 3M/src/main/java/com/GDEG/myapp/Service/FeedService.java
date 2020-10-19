package com.GDEG.myapp.Service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.GDEG.myapp.DAO.FollowerDAO;
import com.GDEG.myapp.DAO.feedDAO;
import com.GDEG.myapp.DAO.likeDAO;
import com.GDEG.myapp.DAO.memberDAO;
import com.GDEG.myapp.DTO.FeedDTO;
import com.GDEG.myapp.DTO.likeDTO;
import com.GDEG.myapp.DTO.memberDTO;
@Service
public class FeedService {
	ModelAndView mav = new ModelAndView();

	@Autowired
	private feedDAO fdao;

	@Autowired
	private FollowerDAO pdao;
	
	@Autowired
	private memberDAO cdao;
	@Autowired
	HttpSession session;
	@Autowired
	private likeDAO lidao;
	
	// 피드 작성
	public ModelAndView feedWriterFile(FeedDTO feed) throws IllegalStateException,IOException {
		MultipartFile ffile = feed.getFile();
		String fileName = ffile.getOriginalFilename();
		String savePath ="C:/Users/1/Documents/workspace-spring-tool-suite-4-4.7.1.RELEASE/3M/src/main/webapp/resources/fileUpload/"+fileName;
		
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
		
		// 피드목록
		List<FeedDTO> MyFeedList = fdao.myFeed(id);
		// 전체 피드
		List<FeedDTO> feed = fdao.allFeedView();
		// 트레이너 정보
		List<memberDTO> trainer = cdao.trasiner(id);
//		좋아요 목록 가져오기
		List<likeDTO> like = lidao.alllike();
		if(feed != null) {
			mav.addObject("feeds", feed);
			mav.addObject("MyFeedList",MyFeedList);
			mav.addObject("trainer",trainer);
			mav.addObject("like", like);
			mav.setViewName("feed");
		}
		return mav;
	}
	
	// 피드 수정
	public ModelAndView ModifyProcess(FeedDTO feed) throws IllegalStateException, IOException {
		MultipartFile bfile = feed.getFile();
		String fileName = bfile.getOriginalFilename();
		String savePath = "D:/HISTORY/Spring/3M/src/main/webapp/resources/fileUpload/" + fileName;

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
//	좋아요
	 public void feedlike(likeDTO like) { 

		likeDTO likecheck= lidao.feedlikecheck(like); 
		System.out.println("Ser_likecheck : " + likecheck);
		
		if(likecheck==null) { 
			  lidao.like(like); 
			 
		} else { 
			 lidao.unlike(like); 
				
		}
	  
		 
	  }



}

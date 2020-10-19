package com.GDEG.myapp.Service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.GDEG.myapp.DAO.SDAO;
import com.GDEG.myapp.DAO.feedDAO;
import com.GDEG.myapp.DTO.FeedDTO;
import com.GDEG.myapp.DTO.FollowerDTO;
import com.GDEG.myapp.DTO.boardDTO;
import com.GDEG.myapp.DTO.massageDTO;
import com.GDEG.myapp.DTO.memberDTO;
import com.GDEG.myapp.DTO.reportDTO;


@Service
public class SService {

	private ModelAndView mav = new ModelAndView();
	
	@Autowired
	private SDAO dao;
	
	@Autowired
	private feedDAO fdao;
	
	List<FollowerDTO> follower = new ArrayList<FollowerDTO>();
	List<FeedDTO> feed = new ArrayList<FeedDTO>();
	public ModelAndView boardWrite(boardDTO board, HttpServletResponse response) throws IllegalStateException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		MultipartFile file = board.getFile();
		String fileName = file.getOriginalFilename();
String savePath ="D:/js/mySpringFile/3M/webapp/resources/fileUpload/"+fileName;
		
		if(!file.isEmpty()) {
			file.transferTo(new File (savePath));
		}
		board.setFilename(fileName);
		 out.println("<script>window.history.back();</script>");
		
		dao.boardWrite(board);
		mav.setViewName("board");
		return mav;
	}

	public List<boardDTO> boardList() {
		List<boardDTO> boardList = dao.boardList();
		return boardList;
	}

	public boardDTO boardView(int num) {
		boardDTO board = dao.boardView(num);
		System.out.println("boardView 에서 board" +board);
		return board;
	}

	public List<boardDTO> boardHealthList() {
		List<boardDTO> boardList = dao.boardHealthList();
		return boardList;
	}

	public List<boardDTO> boardFitnessList() {
		List<boardDTO> boardList = dao.boardFitnessList();
		return boardList;
	}

	public List<reportDTO> reportList() {
		List<reportDTO> reportList = dao.reportList();
		return reportList;
	}

	public ModelAndView sendMassage(massageDTO massage, HttpServletResponse response) {
		int result = dao.sendMassage(massage);
		if(result>0) {
			mav.setViewName("massageSuccess");
		}
		return mav;
	}

	public List<massageDTO> massageList(String id) {
		List<massageDTO> massageList= dao.massageList(id);
		return massageList;
	}

	public ModelAndView boardmodify(boardDTO board, HttpServletResponse response) throws IllegalStateException, IOException {
		MultipartFile file = board.getFile();
		String fileName = file.getOriginalFilename();
String savePath ="D:/js/mySpringFile/3M/webapp/resources/fileUpload/"+fileName;
		
		if(!file.isEmpty()) {
			file.transferTo(new File (savePath));
		}
		board.setFilename(fileName);
		
		
		int result = dao.boardmodify(board);
		
		if(result>0) {
			mav.setViewName("board");
		}
		return mav;
	}

	public void boardDelete(int num) {
		dao.boardDelete(num);
		
	}

	public List<FeedDTO> lastFeed(String id) {
		List<FeedDTO> feed = new ArrayList<FeedDTO>();
		feed = fdao.lastFeed(id);
		return feed;
	}

	public List<FeedDTO> myFeed(String id) {
		List<FeedDTO> feed = new ArrayList<FeedDTO>();
		feed = fdao.myFeed(id);
		return feed;
	}

	public List<FeedDTO> allFeedView() {
		List<FeedDTO> feed = new ArrayList<FeedDTO>();
		feed = fdao.allFeedView();
		return feed;
	}

	public memberDTO getView(String id) {
		memberDTO member = dao.getView(id);
		return member;
	}
	
	public List<FollowerDTO> followView(String id) {
		List<FollowerDTO> follow = new ArrayList<FollowerDTO>();
		follow = dao.followView(id);
		return follow;
	}

	public List<FeedDTO> allFollowView(String id) {
		
		feed = dao.allFollowView(id);
		return feed;
	}

	public List<FollowerDTO> followerFeed(String id) {
		
		follower = dao.followerFeed(id);
		System.out.println("서비스"+follower);
		return follower;
	}

	public List<FeedDTO> followerFeedView(String id) {
		
		feed = dao.followerFeedView(id);
		
		return feed;
	}

	public List<FeedDTO> feedSearch(String key) {
		feed = dao.feedSearch(key);
		System.out.println("===================================================================================================");
		System.out.println("Ser_feed : " + feed);
		System.out.println("===================================================================================================");
		return feed;
	}
}

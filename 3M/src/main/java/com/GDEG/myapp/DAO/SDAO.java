package com.GDEG.myapp.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.GDEG.myapp.DTO.FeedDTO;
import com.GDEG.myapp.DTO.FollowerDTO;
import com.GDEG.myapp.DTO.boardDTO;
import com.GDEG.myapp.DTO.massageDTO;
import com.GDEG.myapp.DTO.memberDTO;
import com.GDEG.myapp.DTO.reportDTO;

@Repository
public class SDAO {

	@Autowired
	private SqlSessionTemplate sql;

	public int boardWrite(boardDTO board) {
		System.out.println("디에이오 board"+board);
		return sql.insert("Board.boardWrite", board);
	}

	public List<boardDTO> boardList() {
		return sql.selectList("Board.boardList");
	}

	public boardDTO boardView(int num) {
		return sql.selectOne("Board.boardView",num);
	}

	public List<boardDTO> boardHealthList() {
		return sql.selectList("Board.boardHealthList");
	}
	public List<boardDTO> boardFitnessList() {
		return sql.selectList("Board.boardFitnessList");
	}

	public List<reportDTO> reportList() {
		return sql.selectList("Report.reportList");
	}

	public int sendMassage(massageDTO massage) {
		return sql.insert("Massage.sendMassage", massage);
	}

	public List<massageDTO> massageList(String id) {
		return sql.selectList("Massage.massageList",id );
	}

	public int boardmodify(boardDTO board) {
		return sql.update("Board.boardmodify",board);
	}

	public void boardDelete(int num) {
		sql.delete("Board.boardDelete",num);
	}

	public memberDTO getView(String id) {		
		return sql.selectOne("Member.getView",id);
	}
	public List<FollowerDTO> followView(String id) {
		return sql.selectList("Follow.follower", id);
	}

	public List<FeedDTO> allFollowView(String id) {
		return sql.selectList("Feed.allFollowView",id);
	}
	public List<FollowerDTO> followerFeed(String id) {
		return sql.selectList("Follow.followerFeed", id);
	}

	public List<FeedDTO> followerFeedView(String id) {
		return sql.selectList("Feed.follower", id);
	}

	public List<FeedDTO> feedSearch(String key) {	
		return sql.selectList("Feed.Search", key);
	}
}

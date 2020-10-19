package com.GDEG.myapp.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.GDEG.myapp.DTO.FeedDTO;
import com.GDEG.myapp.DTO.FollowerDTO;
@Repository
public class feedDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	// 피드 작성
	public int feedWriterFile(FeedDTO feed) {
		return sql.insert("Feed.feedwriterFile",feed);
	}
	// 피드 수정하기
	public int modifyProcess(FeedDTO feed) {
		return sql.update("Feed.modifyProcess",feed);
	}
	// 피드 삭제하기
	public int FeedDelete(int fnum) {
		return sql.delete("Feed.FeedDelete",fnum);
	}
	// 피드 상세보기
	public FeedDTO FeedView(String id) {
		return sql.selectOne("Feed.FeedView",id);
	}
	// 피드 리스트
	public List<FeedDTO> allFeedView() {
		return sql.selectList("Feed.allFeedView");
	}
	public List<FeedDTO> myFeed(String id) {
		return sql.selectList("Feed.myFeed", id);
	}
	public List<FeedDTO> lastFeed(String id) {
		return sql.selectOne("Feed.lastFeed", id);
	}
	public FeedDTO feedmodify(String id) {
		return sql.selectOne("Feed.feedmodify", id);
	}
	
	


}

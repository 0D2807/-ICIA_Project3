package com.GDEG.myapp.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.GDEG.myapp.DTO.likeDTO;

@Repository
public class likeDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	
	
	public likeDTO feedlikecheck(likeDTO like) {
		System.out.println("DAO_like : " + like);
		return sql.selectOne("Like.likeid", like);
	}
	  
	  public int like(likeDTO like) {
		  return sql.insert("Like.glike", like); 
	}
	  
	  public int unlike(likeDTO like) {
		  return sql.delete("Like.unlike", like); 
	}

	public List<likeDTO> alllike() {
		return sql.selectList("Like.alllike");
	}

	 



}
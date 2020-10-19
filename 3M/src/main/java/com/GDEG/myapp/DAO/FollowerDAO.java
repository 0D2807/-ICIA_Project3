package com.GDEG.myapp.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.GDEG.myapp.DTO.FollowerDTO;
@Repository
public class FollowerDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	public List<FollowerDTO> followView(String id) {
		System.out.println("==========================================================");
		System.out.println("id : " + id);
		System.out.println("==========================================================");
		return sql.selectList("Follow.follower", id);
	}
	

}

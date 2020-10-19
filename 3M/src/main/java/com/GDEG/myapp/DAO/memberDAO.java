package com.GDEG.myapp.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.GDEG.myapp.DTO.memberDTO;
@Repository
public class memberDAO {
	@Autowired
	private SqlSessionTemplate sql;
	public List<memberDTO> trasiner(String id) {
		return sql.selectList("TRAINER.trainer",id);
	}

}

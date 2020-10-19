package com.GDEG.myapp.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.GDEG.myapp.DTO.FollowerDTO;
import com.GDEG.myapp.DTO.memberDTO;

@Repository
public class mDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
//	회원가입
	public int join(memberDTO member) {

		return sql.insert("Member.join", member);
	}
	
//	로그인(암호화 비밀번호확인)
	public String memberEncPw(String id) {	
		return sql.selectOne("Member.encPw", id);
	}
//	로그인(아이디)
	public String memberlogin(String id) {
		return sql.selectOne("Member.login", id);
	}
//	로그인(전체)
	public memberDTO memberinfo(String id) {
		return sql.selectOne("Member.member", id);
	}

//	회원정보수정
	public int process(memberDTO member) {
		return sql.update("Member.process", member);
	}

//	수정정보확인
	public memberDTO proView(String id) {
		return sql.selectOne("Member.proView", id);
	}

	public int mProcess(memberDTO member) {
		return sql.update("Member.mProcess", member);
	}

	public memberDTO memberView(String id) {
		System.out.println("디에이오id"+id);
		return sql.selectOne("Member.mView", id);
	}

	public memberDTO test(String id) {
		return sql.selectOne("Member.test",id);
	}

	public memberDTO memberList(String id) {
		return sql.selectOne("Member.memberList", id);
	}



//	팔로우 목록 찾기



}

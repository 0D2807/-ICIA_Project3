package com.GDEG.myapp.DTO;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class memberDTO {
	private String id;
	private String pw;
	private String cname;
	private String health;
	private String fitness;
	private int point;
	private String email;
	private String gender;
	private Date birth;
	private int trainer;
	
	private MultipartFile file;
	private String filename;
	private String intro;
	
}

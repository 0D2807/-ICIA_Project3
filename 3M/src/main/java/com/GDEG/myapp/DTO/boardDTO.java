package com.GDEG.myapp.DTO;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
public class boardDTO {
	private int num;
	private String  title;
	private String  content;
	private Date  fdate;
	private String fid;
	private int  hit;
	private MultipartFile  file;
	private String filename;
	private String rq;
}

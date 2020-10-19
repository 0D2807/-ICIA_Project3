package com.GDEG.myapp.DTO;

import java.util.Date;
import org.springframework.web.multipart.MultipartFile;
import lombok.Data;
@Data
public class FeedDTO {

	private int fnum;
	private String title;
	private String conten;
	private Date fdate;
	private String fid;
	private int hit;
	private int good;
	
	private MultipartFile file;
	private String filename;
}

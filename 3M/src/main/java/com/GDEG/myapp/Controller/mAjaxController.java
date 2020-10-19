package com.GDEG.myapp.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.GDEG.myapp.DTO.memberDTO;
import com.GDEG.myapp.Service.MService;


@Controller
@RequestMapping("/mAjax/*")
public class mAjaxController {
	
	@Autowired
	MService masvc;

	
	
	


	@RequestMapping(value ="/memberProfile")
	public @ResponseBody memberDTO memberList(@RequestParam(value = "id") String id) {
		
		memberDTO mdto = masvc.memberList(id);
		System.out.println("==========================================================================");
		System.out.println("Con_Listmdto : " + mdto);
		System.out.println("==========================================================================");
		return mdto;
		
	}
}

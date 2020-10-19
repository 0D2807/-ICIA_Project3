package com.GDEG.myapp.Controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.GDEG.myapp.DTO.massageDTO;
import com.GDEG.myapp.Service.SService;

@Controller
@RequestMapping("/massage/*")
public class massageController {
	ModelAndView mav = new ModelAndView();

	@Autowired
	private SService svc;
	
	
	@RequestMapping(value="/getMassage")
	public @ResponseBody List<massageDTO> massageList(@RequestParam(value="getid") String id) {
		List<massageDTO> massageList = new ArrayList<massageDTO>();
		massageList = svc.massageList(id);
		return massageList;
	}
}
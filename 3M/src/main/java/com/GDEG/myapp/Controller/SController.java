package com.GDEG.myapp.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.GDEG.myapp.DTO.boardDTO;
import com.GDEG.myapp.DTO.massageDTO;
import com.GDEG.myapp.Service.SService;

@Controller
public class SController {

	private ModelAndView mav = new ModelAndView();

	@Autowired
	private SService svc;
	@RequestMapping(value = "/mainController")
	public String mainController() {	
		
		return "main";
	}
	
	@RequestMapping(value = "/boardWrite")
	public ModelAndView boardWrite(@ModelAttribute boardDTO board, HttpServletResponse response) throws IllegalStateException, IOException {
	
		mav = svc.boardWrite(board, response);
		return mav;
	}
	@RequestMapping(value = "/board")
	public String board() {	
		
		return "board";
	}
	
	@RequestMapping(value = "/report")
	public String report() {	
		
		return "report";
	}
	
	@RequestMapping(value = "/sendMassage")
	public ModelAndView sendMassage(@ModelAttribute massageDTO massage, HttpServletResponse response) throws IOException {
		mav = svc.sendMassage(massage, response);
		return mav;
	}
	
	@RequestMapping(value = "/boardmodify")
	public ModelAndView boardmodify(@ModelAttribute boardDTO board, HttpServletResponse response) throws IllegalStateException, IOException {
		mav = svc.boardmodify(board, response);
		return mav;
	}
	
	@RequestMapping(value="/massageWrite")
	public String massageWrite() {
		return "massage";
	}
}

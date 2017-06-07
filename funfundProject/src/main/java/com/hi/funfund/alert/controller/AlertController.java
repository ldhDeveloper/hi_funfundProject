package com.hi.funfund.alert.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class AlertController {
	
	@RequestMapping("messagelist.al")
	public ModelAndView selectList(ModelAndView model){
		
		model.setViewName("common/alert");
		return model;
	}
	

}

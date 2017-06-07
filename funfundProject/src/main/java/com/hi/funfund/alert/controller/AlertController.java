package com.hi.funfund.alert.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.alert.model.service.AlertService;
import com.hi.funfund.alert.model.vo.Alert;
import com.hi.funfund.attachment.model.service.AttachmentService;

@Controller

public class AlertController {
	
	@Autowired
	private AlertService alertService;
	
	@RequestMapping("messagelist.al")
	public ModelAndView selectCount(ModelAndView model){
		
		model.setViewName("common/alert");
		return model;
	}
	
	@RequestMapping("selectlist.al")
	public ModelAndView selectList(ModelAndView model, Alert alert, @RequestParam("ano")int ano){
		List<Alert> alist = alertService.selectList(ano);
		System.out.println(alist);
		model.addObject("alist", alist);
		model.setViewName("jsonView");
		return model;
	}
	

}

package com.hi.funfund.alert.controller;

import java.util.HashMap;
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
	public ModelAndView selectList(ModelAndView model, Alert alert, @RequestParam("ano")int ano, @RequestParam("page") int page ){
		int sNum = page * 3 - 2;
		int eNum = sNum + 2;
		HashMap map = new HashMap();
		map.put("sNum", sNum);
		map.put("eNum", eNum);
		map.put("page", page);
		map.put("ano", ano);
		List<Alert> alist = alertService.selectList(map);
		int messageCount = alertService.getmessageCount(ano);
		System.out.println(alist);
		model.addObject("alist", alist);
		model.addObject("totalMessageNumber", messageCount);
		model.setViewName("jsonView");
		return model;
	}
	
	@RequestMapping("selectone.al")
	public ModelAndView selectOne(ModelAndView model, @RequestParam("al_no")int al_no){
		System.out.println(al_no);
		
		Alert alert = alertService.selectOne(al_no);
		int result = alertService.updateReadyn(al_no);
		
		
		model.addObject("alert", alert);
		model.setViewName("common/alertdetail");
		return model;
	}
	
	@RequestMapping("deletechecked.al")
	public ModelAndView deleteChecked(ModelAndView model, @RequestParam("nolist")int[] nolist){
		System.out.println(nolist[0]);
		
		for(int i = 0; i < nolist.length; i++){
			int result = alertService.deleteAlert(nolist[i]);
		}
	

		model.setViewName("common/alert");
		return model;
	}
	@RequestMapping("deleteone.al")
	public ModelAndView deleteOne(ModelAndView model, @RequestParam("al_no")int al_no){
		
		int result = alertService.deleteAlert(al_no);
	

		model.setViewName("common/alert");
		return model;
	}

}

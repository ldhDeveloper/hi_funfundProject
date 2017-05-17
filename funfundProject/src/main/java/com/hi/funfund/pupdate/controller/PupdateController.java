package com.hi.funfund.pupdate.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.pupdate.model.service.PupdateService;
import com.hi.funfund.pupdate.model.vo.Pupdate;

@Controller

public class PupdateController {
	
	@Autowired
	private PupdateService PupdateService;
	
	
	public String insert(Pupdate pUpdate){
		int result = PupdateService.insert(pUpdate);
		return null;
	}
	
	
	public String update(Pupdate pUpdate){
		int result = PupdateService.update(pUpdate);
		
		return null;
	}
	
	public String delete(int upno){
		int result = PupdateService.delete(upno);
		
		return null;
	}
	
	    @RequestMapping("news.up")
		public ModelAndView selectList(ModelAndView model, HttpServletRequest request){
	    int pro_no = Integer.valueOf(request.getParameter("pro_no"));
		List<Pupdate> pList = PupdateService.selectList(pro_no);
		model.setViewName("funding/news");
		model.addObject("pList", pList);
		System.out.println("pList: "+pList);
		return model;
		}	
	
}

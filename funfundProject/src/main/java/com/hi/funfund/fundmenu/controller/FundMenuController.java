package com.hi.funfund.fundmenu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.fundmenu.model.service.FundMenuService;
import com.hi.funfund.fundmenu.model.vo.FundMenu;

@Controller
@RequestMapping("fundMenu")
public class FundMenuController {
	
	@Autowired 
	private FundMenuService fundMenuService;
	
	public ModelAndView selectOne(int pro_no, ModelAndView model){
		
		FundMenu fm = fundMenuService.selectOne(pro_no);
		
		return model;
	}
	public String insert(FundMenu fm){
		
		int result = fundMenuService.insert(fm);
				
		return null;
	}
	public String update(FundMenu fm){
		
		int result = fundMenuService.update(fm);
		
	return null;
	}
	public String delete(int pro_no){
		
		int result = fundMenuService.delete(pro_no);
		
		return null;
	}
	
}

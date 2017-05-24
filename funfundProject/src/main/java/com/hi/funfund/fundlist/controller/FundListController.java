package com.hi.funfund.fundlist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.fundlist.model.service.FundListService;
import com.hi.funfund.fundlist.model.vo.FundList;

@Controller
//@RequestMapping("fundList")
public class FundListController {

	@Autowired
	private FundListService fundListService;

	public ModelAndView selectList(ModelAndView model) {

		List<FundList> fList = fundListService.selectList();

		return model;

	}

	public String insert(FundList fList) {

		int result = fundListService.insert(fList);

		return null;
	}

	public String update(FundList fList) {

		int result = fundListService.update(fList);
		return null;
	}
	
	@RequestMapping(value = "myfundingDetail.fl")
	public String myfundingDetail(){
		System.out.println("오니?");
		
		
		
		return "myinfo/myfundingDetail";
	}
}

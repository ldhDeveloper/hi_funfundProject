package com.hi.funfund.fundlist.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.fundlist.model.service.FundListService;
import com.hi.funfund.fundlist.model.vo.FundList;
import com.hi.funfund.fundlist.model.vo.Mysponsor;
import com.hi.funfund.item.model.service.ItemService;
import com.hi.funfund.item.model.vo.Item;

@Controller
//@RequestMapping("fundList")
public class FundListController {

	@Autowired
	private FundListService fundListService;

  @Autowired
  private ItemService itemService;  

@RequestMapping(value = "myproject.fl", method = RequestMethod.GET)
public ModelAndView selectMyProject(ModelAndView model, HttpSession session, HttpServletRequest request){
	String pro_no = request.getParameter("pro_no");
	Item proItem = itemService.selectOne(Integer.parseInt(pro_no));
	List<Mysponsor> mlist = fundListService.selectSponsorList(Integer.parseInt(pro_no));
	model.addObject("proItem", proItem);
	model.addObject("mlist", mlist);
	model.setViewName("myproject/myprojectDetail");
	return model;
}

public ModelAndView selectList(ModelAndView model){
	
	List<FundList> fList = fundListService.selectList();
	
	return model;
	
}
 
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

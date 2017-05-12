package com.hi.funfund.item.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.item.model.service.ItemService;
import com.hi.funfund.item.model.service.ItemServiceIm;
import com.hi.funfund.item.model.vo.Item;

@Controller

public class ItemController {

	@Autowired
	private ItemService itemService;

	
	public ModelAndView AllList(ModelAndView model){
		List<Item> mList = itemService.AllList();
		
		return model;
	}  
	
	public ModelAndView rewardingList(ModelAndView model){
		
		List<Item> mList = itemService.rewardingList();
		
		return model;
	}
	
	public ModelAndView donationList(ModelAndView model){
		
		List<Item> mList = itemService.donationList();
		return model;
	}
	
	public ModelAndView selectFunddingList(ModelAndView model){
		
		
		return model;
	}
	
	public ModelAndView PickList(ModelAndView model){
		
		
		return model;
	}
	
	public ModelAndView selectMyList(int pro_no, ModelAndView model){
		

		return model;
	}
	
	public ModelAndView selectRecommendList(ModelAndView model){
		
		return model;
	}

	public ModelAndView categoryList(ModelAndView model){
		
		return model;
	}
	
	public ModelAndView searchItemWriter(ModelAndView model){
		
		return model;
	}

	public ModelAndView searchItemTitle(ModelAndView model){
		
		return model;
	}
	
	public ModelAndView selectOne(ModelAndView model){
		
		return model;
	}

	public ModelAndView selectOngoingItemList(ModelAndView model){
		
		return model;
	}

	public ModelAndView selectEndItemList(ModelAndView model){
		
		return model;
	}

	public ModelAndView getGrowRate(ModelAndView model){
		
		return model;
	}

	@RequestMapping("insert.it")
	public ModelAndView insertRewardItem(ModelAndView model, HttpSession session, HttpServletRequest request){
		int ano = Integer.parseInt(request.getParameter("ano"));
		System.out.println("ano : " + ano);
		Item item = new Item();
		item.setAno(ano);
		
		int pro_no = itemService.insertRewardItem(item);
		
		System.out.println("result : " + pro_no);
		request.setAttribute("pro_no", pro_no);
		model.setViewName("makeproject/primaryinfo");
		
		return model;
	}
	
	@RequestMapping("funding.it")
	public ModelAndView funding(ModelAndView model){
		List<Item> iList = itemService.AllList();
		model.addObject("iList", iList);
		model.setViewName("funding/funding");
		return model;
	}
	
}

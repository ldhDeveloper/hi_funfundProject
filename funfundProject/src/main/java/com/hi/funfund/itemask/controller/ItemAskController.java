package com.hi.funfund.itemask.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.itemask.model.service.ItemAskService;
import com.hi.funfund.itemask.model.vo.ItemAsk;

@Controller
@RequestMapping("itemAsk")
public class ItemAskController {

	@Autowired 
	private ItemAskService itemAskService;
	
	
	public String insert(ItemAsk itemAsk){
	
		int result = itemAskService.insert(itemAsk);
		
		return null;
	} 
	
	
	public String update(ItemAsk itemAsk){
		int result = itemAskService.update(itemAsk);
		return null;
	}
	
	public String delete(int ask_no){
		int result = itemAskService.delete(ask_no);
		
		return null;
	}
	
	public String selectList(int pro_no, ModelAndView model){
		
		List<ItemAsk> itemAskList =  itemAskService.selectList(pro_no);
		
		model.addObject("itemAskList", itemAskList);
		
		return null;
	}
}

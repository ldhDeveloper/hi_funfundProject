package com.hi.funfund.item.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.item.model.service.ItemService;
import com.hi.funfund.item.model.vo.Item;

@Controller
@RequestMapping("item")
public class ItemController {

	/*@Autowired
	private ItemService itemService;

	@RequestMapping(value = "/detail.do", method = RequestMethod.POST)
	public ModelAndView selectOne(int pro_no, ModelAndView mv) {
		Item detailList = itemService.selectOne(pro_no);
		mv.addObject("detailList", detailList);
		mv.setViewName("funding/detailList"); 
		return mv;
	}*/
}

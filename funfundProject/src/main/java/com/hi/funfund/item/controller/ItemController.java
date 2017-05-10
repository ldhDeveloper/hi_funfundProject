package com.hi.funfund.item.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

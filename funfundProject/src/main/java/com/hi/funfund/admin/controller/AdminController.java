package com.hi.funfund.admin.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.account.model.vo.Account;
import com.hi.funfund.account.model.vo.Party;
import com.hi.funfund.item.model.service.ItemService;
import com.hi.funfund.item.model.vo.Item;

@Controller
public class AdminController {

	@Autowired
	private ItemService itemService;
	
	@RequestMapping("/itemconfirm.am")
	public ModelAndView selectRequestItem(ModelAndView mv, HttpServletRequest request){
		List<Item> alist = itemService.selectRequestItem();
		
		mv.addObject("alist", alist);
		mv.setViewName("admin/itemconfirm");
		return mv;
	}
}

package com.hi.funfund.admin.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping("/requestdeleteitem.am")
	public ModelAndView selectDeleteRequest(ModelAndView mv, HttpServletRequest request){
		List<Item> alist = itemService.selectDeleteRequest();
		
		mv.addObject("alist", alist);
		mv.setViewName("admin/requestDeleteItem");
		return mv;
	}
	
	@RequestMapping("/resultitem.am")
	public ModelAndView selectEndItem(ModelAndView mv, HttpServletRequest request){
		List<Item> alist = itemService.selectEndItem();
		
		mv.addObject("alist", alist);
		mv.setViewName("admin/funddingResult");
		return mv;
	}
	
	@RequestMapping(value ="/confirmstatus.am", method = RequestMethod.POST)
	public @ResponseBody int updateConfirmStatus(@RequestParam("pro_no") String prono){
		int pro_no = Integer.parseInt(prono);
		int result = itemService.updateConfirmStatus(pro_no);
		return result;
	}
	
	@RequestMapping(value ="/rejectstatus.am", method = RequestMethod.POST)
	public @ResponseBody int updateRejectStatus(@RequestParam("pro_no") String pro_no, @RequestParam("comment") String comment){
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("pro_no", pro_no);
		hmap.put("comment", comment);
		int result = itemService.updateRejectStatus(hmap);
		return result;
	}
	
	@RequestMapping(value ="/deletestatus.am", method = RequestMethod.POST)
	public @ResponseBody int updateDeleteStatus(@RequestParam("pro_no") String pro_no, @RequestParam("comment") String comment){
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("pro_no", pro_no);
		hmap.put("comment", comment);
		int result = itemService.updateDeleteStatus(hmap);
		return result;
	}
	
	@RequestMapping(value ="/successstatus.am", method = RequestMethod.POST)
	public @ResponseBody int updateSuccessStatus(@RequestParam("pro_no") String prono){
		int pro_no = Integer.parseInt(prono);
		int result = itemService.updateSuccessStatus(pro_no);
		return result;
	}
	
}

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

import com.hi.funfund.account.model.service.AccountService;
import com.hi.funfund.account.model.vo.Account;
import com.hi.funfund.account.model.vo.Party;
import com.hi.funfund.item.model.service.ItemService;
import com.hi.funfund.item.model.vo.Item;

@Controller
public class AdminController {

	@Autowired
	private ItemService itemService;
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping("/itemconfirm.am")
	public ModelAndView selectRequestItem(ModelAndView mv, HttpServletRequest request){
		List<Item> alist = itemService.selectRequestItem();
		
		mv.addObject("alist", alist);
		mv.setViewName("admin/itemconfirm");
		return mv;
	}
	
	@RequestMapping("/successFundding.am")
	public ModelAndView selectSuccessItem(ModelAndView mv, HttpServletRequest request){
		List<Item> alist = itemService.selectSuccessItem();
		
		mv.addObject("alist", alist);
		mv.setViewName("admin/funddingSuccess");
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
		System.out.println("pro_no : " + pro_no);
		int result = itemService.updateSuccessStatus(pro_no);
		return result;
	}
	
	@RequestMapping(value ="/failstatus.am", method = RequestMethod.POST)
	public @ResponseBody int updateFailStatus(@RequestParam("pro_no") String pro_no, @RequestParam("comment") String comment){
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("pro_no", pro_no);
		hmap.put("comment", comment);
		int result = itemService.updateFailStatus(hmap);
		return result;
	}
	
	@RequestMapping(value ="/changeBillStatus.am", method = RequestMethod.POST)
	public @ResponseBody int changeBillStatus(@RequestParam("pro_no") String pro_no, @RequestParam("firstprice") String firstprice, @RequestParam("secondprice") String secondprice){
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("pro_no", pro_no);
		hmap.put("firstprice", firstprice);
		hmap.put("secondprice", secondprice);
		int result = itemService.changeBillStatus(hmap);
		return result;
	}
	@RequestMapping(value ="/sellerconfirm.am")
	public ModelAndView selectRequestSeller(ModelAndView model){
		List<Account> alist = accountService.selectRequestSeller();
		model.addObject("alist", alist);
		model.setViewName("admin/confirmSeller");
		return model;
	}
}

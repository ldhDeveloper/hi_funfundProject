package com.hi.funfund.fundmenu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.hi.funfund.fundmenu.model.service.FundMenuService;
import com.hi.funfund.fundmenu.model.vo.FundMenu;
import com.hi.funfund.item.model.service.ItemService;
import com.hi.funfund.item.model.vo.Item;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import net.sf.json.JSONObject;

@Controller

public class FundMenuController {

	@Autowired
	private FundMenuService fundMenuService;
	@Autowired
	private ItemService itemService;

	@RequestMapping("reward.fm")
	public ModelAndView selectList(int pro_no, ModelAndView model) {
		List<FundMenu> mList = fundMenuService.selectList(pro_no);
		Item item = itemService.selectOne(pro_no);
		model.addObject("mList", mList);
		model.addObject("item", item);
		System.out.println("itemController : " + item);
		System.out.println("mlistController : " + mList);
		model.setViewName("payment/rewardList");
		return model;

	}
	
	
	@RequestMapping(value="selectfmenu.fm" ,method=RequestMethod.GET)
	public ModelAndView selectfmenuList(@RequestParam("pro_no")int pro_no, ModelAndView model) {
		ArrayList<FundMenu> fmenulist = null;
		fmenulist = fundMenuService.selectList2(pro_no);
		
		model.setViewName("jsonView");
		model.addObject("fmenulist", fmenulist);
		
		return model;

	}

	public String insert(FundMenu fm) {

		int result = fundMenuService.insert(fm);

		return null;
	}

	public String update(FundMenu fm) {

		int result = fundMenuService.update(fm);

		return null;
	}

	public String delete(int pro_no) {

		int result = fundMenuService.delete(pro_no);

		return null;
	}

}

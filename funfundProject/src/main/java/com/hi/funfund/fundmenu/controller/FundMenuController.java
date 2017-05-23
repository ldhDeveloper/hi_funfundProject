package com.hi.funfund.fundmenu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.fundmenu.model.service.FundMenuService;
import com.hi.funfund.fundmenu.model.vo.FundMenu;
import com.hi.funfund.item.model.service.ItemService;
import com.hi.funfund.item.model.vo.Item;

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
		model.setViewName("payment/rewardList");
		return model;

	}
	
	
	@RequestMapping(value = "selectList.fm", method = RequestMethod.GET)
	public @ResponseBody List<FundMenu> selectfList(int pro_no) {
		System.out.println("ppppp:"+pro_no);
		ArrayList<FundMenu> mList = fundMenuService.selectList(pro_no);
		System.out.println("오니?");
		if (mList != null) {
			System.out.println("ajaxmList: " + mList);
		}
		return mList;
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

package com.hi.funfund.item.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.fundmenu.model.service.FundMenuService;
import com.hi.funfund.fundmenu.model.vo.FundMenu;
import com.hi.funfund.item.model.service.ItemService;
import com.hi.funfund.item.model.service.ItemServiceIm;
import com.hi.funfund.item.model.vo.Item;
import com.hi.funfund.itemask.model.service.ItemAskService;
import com.hi.funfund.itemask.model.vo.ItemAsk;

@Controller

public class ItemController {

	@Autowired
	private ItemService itemService;
	@Autowired
	private FundMenuService fundMenuService;
	@Autowired
	private ItemAskService itemAskService;

	public ModelAndView AllList(ModelAndView model) {
		List<Item> mList = itemService.AllList();
		return model;
	}

	public ModelAndView rewardingList(ModelAndView model) {

		List<Item> mList = itemService.rewardingList();

		return model;
	}

	public ModelAndView donationList(ModelAndView model) {

		List<Item> mList = itemService.donationList();
		return model;
	}

	public ModelAndView selectFunddingList(ModelAndView model) {

		return model;
	}

	public ModelAndView PickList(ModelAndView model) {

		return model;
	}

	public ModelAndView selectMyList(int pro_no, ModelAndView model) {

		return model;
	}

	public ModelAndView selectRecommendList(ModelAndView model) {

		return model;
	}

	public ModelAndView categoryList(ModelAndView model) {

		return model;
	}

	public ModelAndView searchItemWriter(ModelAndView model) {

		return model;
	}

	public ModelAndView searchItemTitle(ModelAndView model) {

		return model;
	}

	public ModelAndView selectOne(ModelAndView model) {

		return model;
	}

	public ModelAndView selectOngoingItemList(ModelAndView model) {

		return model;
	}

	public ModelAndView selectEndItemList(ModelAndView model) {

		return model;
	}

	public ModelAndView getGrowRate(ModelAndView model) {

		return model;
	}

	@RequestMapping("insert.it")
	public ModelAndView insertRewardItem(ModelAndView model, HttpSession session, HttpServletRequest request) {
		int ano = Integer.parseInt(request.getParameter("ano"));
		System.out.println("ano : " + ano);
		Item item = new Item();
		item.setAno(ano);

		int result = itemService.insertRewardItem(item);
		model.setViewName("makeproject/primaryinfo");
		request.setAttribute("ano", ano);
		request.setAttribute("pro_no", result);

		return model;
	}

	@RequestMapping(value = "update.it", method = RequestMethod.POST)
	public ModelAndView insertRewardItem(Item item, FundMenu fmenu, HttpServletRequest request) {
		System.out.println("오니?");
		int result1, result2 = 0;

		result1 = itemService.updateRewardItem(item);
		// result2 = fundMenuService.updateFundMenu(fmenu);

		return null;
	}

	@RequestMapping("funding.it")
	public ModelAndView funding(ModelAndView model) {
		List<Item> iList = itemService.AllList();
		model.addObject("iList", iList);
		model.setViewName("funding/funding");
		return model;
	}

	@RequestMapping(value = "detail.it")
	public ModelAndView fundingdetailList(ModelAndView model, HttpServletRequest request) {
		int pro_no = Integer.parseInt(request.getParameter("pro_no"));
		Item item = itemService.selectOne(pro_no);
		List<FundMenu> mList = fundMenuService.selectList(pro_no);
		List<ItemAsk> aList = itemAskService.selectList(pro_no);
		model.addObject("item", item);
		model.addObject("mList", mList);
		model.addObject("aList", aList);
		model.setViewName("funding/detailList");
		return model;
	}

}

package com.hi.funfund.item.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.HomeController;
import com.hi.funfund.fundmenu.model.service.FundMenuService;
import com.hi.funfund.fundmenu.model.vo.FundMenu;
import com.hi.funfund.fundmenu.model.vo.ReciveFundMenu;
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


	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	public ModelAndView AllList(ModelAndView model){
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
	
	@RequestMapping("insertReward.it")
	public ModelAndView insertRewardItem(ModelAndView model, FundMenu fmenu) {
		System.out.println(fmenu);

		return null;
	}

	@RequestMapping(value="update.it", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView insertRewardItem(Item item, @RequestBody String str, /*ReciveFundMenu rfmenu, */HttpServletRequest request ){
		int result1, result2 = 0;
		
			/*System.out.println(rfmenu);*/
		
		

		result1 = itemService.updateRewardItem(item);
		
		/*for(int i = 0; i < rfmenu.getMnum().size(); i ++){
			FundMenu fmenu = new FundMenu();
			fmenu.setMnum(rfmenu.getMnum().get(i));
			fmenu.setPro_no(rfmenu.getPro_no());
			fmenu.setMcost(rfmenu.getMcost().get(i));
			fmenu.setMname(rfmenu.getMname().get(i));
			fmenu.setMcontent(rfmenu.getMcontent().get(i));
			fmenu.setMcount(rfmenu.getMcount().get(i));
			fmenu.setMdate(rfmenu.getMdate().get(i));
			
			System.out.println("반복");
			int insertOrUpdate = fundMenuService.insertOrUpdateFundMenu(fmenu);
			
			
		}*/
		
		
		
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

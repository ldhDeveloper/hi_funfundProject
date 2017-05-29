package com.hi.funfund.pupdate.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hi.funfund.fundmenu.model.service.FundMenuService;
import com.hi.funfund.fundmenu.model.vo.FundMenu;
import com.hi.funfund.item.model.service.ItemService;
import com.hi.funfund.item.model.vo.Item;
import com.hi.funfund.item.model.vo.Itemfund;
import com.hi.funfund.pupdate.model.service.PupdateService;
import com.hi.funfund.pupdate.model.vo.Pupdate;

@Controller

public class PupdateController {

	@Autowired
	private PupdateService PupdateService;
	@Autowired
	private FundMenuService fundMenuService;
	@Autowired
	private ItemService itemService;

	public String insert(Pupdate pUpdate) {
		int result = PupdateService.insert(pUpdate);
		return null;
	}

	public String update(Pupdate pUpdate) {
		int result = PupdateService.update(pUpdate);

		return null;
	}

	public String delete(int upno) {
		int result = PupdateService.delete(upno);

		return null;
	}

	@RequestMapping("news.up")
	public ModelAndView selectList(ModelAndView model, HttpServletRequest request) {
		int pro_no = Integer.valueOf(request.getParameter("pro_no"));
		List<Pupdate> pList = PupdateService.selectList(pro_no);
		Item item = itemService.selectOne(pro_no);
		List<FundMenu> mList = fundMenuService.selectList(pro_no);
		List<Itemfund> bestList=itemService.bestList(pro_no);
		model.addObject("item", item);
		model.addObject("mList", mList);
		model.addObject("pList", pList);
		model.addObject("bestList", bestList);
		model.setViewName("funding/news");
		return model;
	}
	
	@RequestMapping("mynewsup.up")
	public ModelAndView selectMyNewsList(ModelAndView model, HttpServletRequest request) {
		int pro_no = Integer.valueOf(request.getParameter("pro_no"));
		List<Pupdate> pList = PupdateService.selectList(pro_no);
		Item proItem = itemService.selectOne(pro_no);
		model.addObject("proItem", proItem);
		model.addObject("pList", pList);
		model.setViewName("myproject/newslist");
		return model;
	}
	
	@RequestMapping("mynewsinsert.up")
	public String insertMyNews(Pupdate pup, RedirectAttributes ra, ModelAndView model, HttpServletRequest request) {
		System.out.println("업데이트 오니?!!");
		int pro_no = pup.getPro_no();
		/*String ptitle = request.getParameter("ptitle");
		String upname = request.getParameter("newscontent");
		HashMap<String, String> hmap = new HashMap<String, String>();
		pup.setPro_no(Integer.parseInt(pro_no));
		pup.setUpname(upname);
		pup.setUptitle(ptitle);*/
		int result = PupdateService.insert(pup);
		ra.addAttribute("pro_no", pro_no);
		return "redirect:mynewsup.up";
	}
}

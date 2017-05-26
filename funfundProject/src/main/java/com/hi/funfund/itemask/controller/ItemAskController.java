package com.hi.funfund.itemask.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hi.funfund.account.model.vo.Account;
import com.hi.funfund.fundmenu.model.service.FundMenuService;
import com.hi.funfund.fundmenu.model.vo.FundMenu;
import com.hi.funfund.item.model.service.ItemService;
import com.hi.funfund.item.model.vo.Item;
import com.hi.funfund.item.model.vo.Itemfund;
import com.hi.funfund.itemask.model.service.ItemAskService;
import com.hi.funfund.itemask.model.vo.ItemAsk;

@Controller

public class ItemAskController {

	@Autowired
	private ItemAskService itemAskService;
	@Autowired
	private FundMenuService fundMenuService;
	@Autowired
	private ItemService itemService;

	@RequestMapping("coinsert.ask")
	public String insert(HttpSession session, HttpServletRequest request, ModelAndView model,
			RedirectAttributes redirect) {
		String pro_no = request.getParameter("pro_no");
		String acontent = request.getParameter("acontent");
		String ask_no = request.getParameter("ask_no");
		Account account = (Account) session.getAttribute("account");
		System.out.println("account"+account);
		System.out.println("acontent"+acontent);
		System.out.println(pro_no);
		System.out.println("ask_no"+ask_no);
		HashMap<String, String> cmap = new HashMap<String, String>();
		cmap.put("pro_no", pro_no);
		cmap.put("acontent", acontent);
		cmap.put("id_no", Integer.toString(account.getAno()));
		cmap.put("ask_no", ask_no);
		int result = itemAskService.insert(cmap);
		model.setViewName("funding/reply");
		redirect.addAttribute("pro_no", pro_no);
		return "redirect:/reply.ask";
	}

	@RequestMapping("reinsert.ask")
	public String reinsert(HttpSession session, HttpServletRequest request, ModelAndView model,
			RedirectAttributes redirect) {
		String pro_no = request.getParameter("pro_no");
		Account account = (Account) session.getAttribute("account");
		String acontent = request.getParameter("acontent2");
		String upask_no = request.getParameter("upask_no");
		System.out.println("account"+account);
		System.out.println("acontent"+acontent);
		System.out.println(pro_no);
		System.out.println(upask_no);
		HashMap<String, String> cmap = new HashMap<String, String>();
		cmap.put("pro_no", pro_no);
		cmap.put("acontent", acontent);
		cmap.put("upask_no", upask_no);
		cmap.put("id_no", Integer.toString(account.getAno()));
		int result = itemAskService.reinsert(cmap);
		model.setViewName("funding/reply");
		redirect.addAttribute("pro_no", pro_no);
		redirect.addAttribute("upask_no", upask_no);
		return "redirect:/reply.ask";
	}
	
	@RequestMapping("update.ask")
	public String update(HttpServletRequest request, RedirectAttributes redirect) {
		String pro_no=request.getParameter("pro_no");
		String ask_no = request.getParameter("ask_no");
		String acontent = request.getParameter("acontent");
		HashMap<String, String> umap = new HashMap<String, String>();
		umap.put("ask_no", ask_no);
		umap.put("acontent", acontent);
	    System.out.println("update ask_no:"+ask_no);
		int result = itemAskService.update(umap);
		redirect.addAttribute("pro_no", pro_no);
		return "redirect:/reply.ask";
	}

	@RequestMapping("delete.ask")
	public String delete(int ask_no) {
		int result = itemAskService.delete(ask_no);

		return null;
	}

	@RequestMapping("reply.ask")
	public ModelAndView selectList(ModelAndView model, HttpServletRequest request) {
		int pro_no = Integer.parseInt(request.getParameter("pro_no"));
		List<ItemAsk> aList = itemAskService.selectList(pro_no);
		Item item = itemService.selectOne(pro_no);
		List<FundMenu> mList = fundMenuService.selectList(pro_no);
		List<Itemfund> bestList = itemService.bestList(pro_no);
		model.addObject("item", item);
		model.addObject("mList", mList);
		model.addObject("aList", aList);
		System.out.println("a" + aList);
		model.addObject("bestList", bestList);
		model.setViewName("funding/reply");
		return model;
	}

}

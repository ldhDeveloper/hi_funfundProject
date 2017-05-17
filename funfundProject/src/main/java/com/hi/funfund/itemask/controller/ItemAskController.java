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
import com.hi.funfund.itemask.model.service.ItemAskService;
import com.hi.funfund.itemask.model.vo.ItemAsk;

@Controller

public class ItemAskController {

	@Autowired
	private ItemAskService itemAskService;

	@RequestMapping("coinsert.ask")
	public String insert(HttpSession session, HttpServletRequest request, ModelAndView model,
			RedirectAttributes redirect) {
		String pro_no = request.getParameter("pro_no");
		String acontent = request.getParameter("acontent");
		Account account = (Account) session.getAttribute("account");
		System.out.println(account);
		System.out.println(acontent);
		System.out.println(pro_no);
		HashMap<String, String> cmap = new HashMap<String, String>();
		cmap.put("pro_no", pro_no);
		cmap.put("acontent", acontent);
		cmap.put("id_no", Integer.toString(account.getAno()));
		int result = itemAskService.insert(cmap);
		model.setViewName("funding/reply");
		redirect.addAttribute("pro_no", pro_no);
		return "redirect:/reply.ask";
	}

	public String update(ItemAsk itemAsk) {
		int result = itemAskService.update(itemAsk);
		return null;
	}

	public String delete(int ask_no) {
		int result = itemAskService.delete(ask_no);

		return null;
	}

	@RequestMapping("reply.ask")
	public ModelAndView selectList(ModelAndView model, HttpServletRequest request) {
		int pro_no = Integer.parseInt(request.getParameter("pro_no"));
		List<ItemAsk> aList = itemAskService.selectList(pro_no);
		model.addObject("aList", aList);
		model.setViewName("funding/reply");
		return model;
	}

}

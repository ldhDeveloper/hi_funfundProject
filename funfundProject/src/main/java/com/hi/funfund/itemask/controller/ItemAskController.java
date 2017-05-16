package com.hi.funfund.itemask.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.account.model.vo.Account;
import com.hi.funfund.fundmenu.model.vo.FundMenu;
import com.hi.funfund.item.model.vo.Item;
import com.hi.funfund.itemask.model.service.ItemAskService;
import com.hi.funfund.itemask.model.vo.ItemAsk;

@Controller
@RequestMapping("itemAsk")
public class ItemAskController {

	@Autowired
	private ItemAskService itemAskService;

	@RequestMapping(value="/comment.ask")
	public ModelAndView insert(HttpSession session, HttpServletRequest request,
			ModelAndView model) {
		String acontent = request.getParameter("acontent");
		Account account = (Account) session.getAttribute("account");
		String pro_no = request.getParameter("pro_no");
		HashMap<String, String> cmap = new HashMap<String, String>();
		cmap.put("pro_no", pro_no);
		cmap.put("acontent", acontent);
		cmap.put("id_no", Integer.toString(account.getAno()));
		int result = itemAskService.insert(cmap);
		model.setViewName("funding/detailList");
		return model;
	}

	public String update(ItemAsk itemAsk) {
		int result = itemAskService.update(itemAsk);
		return null;
	}

	public String delete(int ask_no) {
		int result = itemAskService.delete(ask_no);

		return null;
	}

	public String selectList(int pro_no, ModelAndView model) {

		List<ItemAsk> itemAskList = itemAskService.selectList(pro_no);
		model.addObject("itemAskList", itemAskList);

		return null;
	}

}

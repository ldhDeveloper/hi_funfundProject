package com.hi.funfund.myitem.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hi.funfund.item.model.service.ItemService;
import com.hi.funfund.myitem.model.service.MyItemService;
import com.hi.funfund.myitem.model.vo.MyItem;

@Controller

public class MyItemController {

	@Autowired
	private MyItemService myItemService;  
	
	@Autowired
	private ItemService itemService;  

	@RequestMapping(value = "insertMyitem.mi", method = RequestMethod.GET)
	public @ResponseBody String insert(HttpSession session, HttpServletRequest request, @RequestParam("pro_no") String pro_no, @RequestParam("ano") String ano){
		HashMap<String, String> hmap = new HashMap<String, String>();
		session = request.getSession(false);
		int[] proList = null;
		hmap.put("pro_no", pro_no);
		hmap.put("ano", ano);
		String end = "fail";
		int result = myItemService.insert(hmap);
		int likeResult = 0;
		if(result > 0){
			likeResult = itemService.plusItemLike(Integer.parseInt(pro_no));
			if(likeResult > 0){
				List<MyItem> myitem = myItemService.select(Integer.parseInt(ano));
				if(myitem != null){
					session.setAttribute("myitem", myitem);
					for(int i=0; i<myitem.size(); i++){
						proList = new int[myitem.size()];
						proList[i] = myitem.get(i).getPro_no();
					}
					session.setAttribute("proList", proList);
				}
				end="success";
			}
		}
		return end;
	}
	
	
	public String delete(int mpro_no){
		
		int result = myItemService.delete(mpro_no);
		
		return null;
	}
	
}

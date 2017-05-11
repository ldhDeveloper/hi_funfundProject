package com.hi.funfund.myitem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.funfund.myitem.model.service.MyItemService;
import com.hi.funfund.myitem.model.vo.MyItem;

@Controller

public class MyItemController {

	@Autowired
	private MyItemService myItemService;  
	
	
	public String insert(MyItem myItem){
		
		int result = myItemService.insert(myItem);
		
		return null;
	}
	
	
	public String delete(int mpro_no){
		
		int result = myItemService.delete(mpro_no);
		
		return null;
	}
	
}

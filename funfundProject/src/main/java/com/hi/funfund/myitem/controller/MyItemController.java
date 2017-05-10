package com.hi.funfund.myitem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.funfund.myitem.model.service.MyItemService;

@Controller
@RequestMapping("myItem")
public class MyItemController {

	@Autowired
	private MyItemService myItemService;  
}

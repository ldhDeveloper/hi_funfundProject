package com.hi.funfund.fundlist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.funfund.fundlist.model.service.FundListService;

@Controller
@RequestMapping("fundList")
public class FundListController {

	
@Autowired
private FundListService fundListService;



}

package com.hi.funfund.pupdate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.funfund.pupdate.model.service.PupdateService;

@Controller
@RequestMapping("pupdate")
public class PupdateController {
	
	@Autowired
	private PupdateService pUpdateService;

}

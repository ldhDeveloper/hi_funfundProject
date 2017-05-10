package com.hi.funfund.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.funfund.notice.model.service.NoticeService;

@Controller
@RequestMapping("notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	
	@RequestMapping("nList.do")
	public String notice(){
		
		return "notice/notice";
	}
	
	
	@RequestMapping("nwrite.do")
	public String Write(){
		
		return "notice/ninsert";
	}
}

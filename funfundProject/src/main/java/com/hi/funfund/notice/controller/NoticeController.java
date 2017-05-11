package com.hi.funfund.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.notice.model.service.NoticeService;
import com.hi.funfund.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	
	@RequestMapping("nList.no")
	public String notice(/*int bno, int page,*/ ModelAndView model){
		
		//List<Notice> nList = noticeService.selectList(bno, page);
		
		//model.addObject("nList", nList);
				
		return "notice/notice";
	}
	
	@RequestMapping("nSearchTitle.no")
	public String searchTitle(int bno,int page, String nTitle, ModelAndView model){
		
		List<Notice> nList = noticeService.searchTitle(bno, page, nTitle);
		
		return "";
	}

	
	@RequestMapping("nInsertView.no")
	public String Write(){
		
		
		return "notice/ninsert";
	}
	
	@RequestMapping("nDetail.no")
	public String selectOne(int nno, ModelAndView model){
		Notice n = noticeService.selectOne(nno);
		model.addObject("n", n);
		return "notice/ndetail";
	}
	@RequestMapping("nUpdate.no")
	public String update(Notice notice){
				
		return null;
		
	}
	@RequestMapping("nDelete.no")
	public String delete(int nno){
		
		return null;
	}
	@RequestMapping("nInsert.no")
	public String insert(Notice notice){
		
		return null;
	}
	
}

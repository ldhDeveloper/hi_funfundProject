package com.hi.funfund.notice.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.notice.model.service.NoticeService;
import com.hi.funfund.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	
	@RequestMapping(value="nList.no",  method=RequestMethod.GET)
	public ModelAndView notice(@RequestParam("sbno") String sbno, @RequestParam("spage") String spage,
								 ModelAndView model){
		HashMap map = new HashMap();
		int bno =Integer.valueOf(sbno);
		int page =Integer.valueOf(spage);
		int sNum = page * 10 +1 -10;
		int eNum = sNum + 9;
		int upbno = 0;
		map.put("bno", bno);
		map.put("sNum", sNum);
		map.put("eNum", eNum);
		map.put("upbno", 0);
		List<Notice> nList = noticeService.selectList(map);
		int listCount = noticeService.getListCount(bno, upbno);
		System.out.println(listCount);
		model.addObject("sbno", sbno);
		model.addObject("spage", spage);
		model.addObject("listCount", listCount);
		model.addObject("nList", nList);
		model.setViewName("notice/notice");
		return model;
	}
	
	@RequestMapping("nSearchTitle.no")
	public ModelAndView searchTitle(@RequestParam("sbno") String sbno,
			@RequestParam("spage") String spage, @RequestParam("nTitle") String nTitle, ModelAndView model){
		HashMap map = new HashMap();
		int bno = Integer.valueOf(sbno);
		int page = Integer.valueOf(spage);
		int listCount = noticeService.getListCountWithTitle(bno, nTitle);
		List<Notice> nList = noticeService.searchTitle(bno, page, nTitle);
		model.addObject("sbno", sbno);
		model.addObject("spage", spage);
		model.addObject("listCount", listCount);
		model.addObject("nList", nList);
		model.setViewName("notice/notice");
		System.out.println("search result : " +nList);
		return model;
	}
	
	@RequestMapping("nInsertView.no")
	public String Write(){
		
		return "notice/ninsert";
	}
	
	@RequestMapping("nDetail.no")
	public ModelAndView selectDetailList(@RequestParam("snno") String snno, @RequestParam("sbno") String sbno,
			@RequestParam("spage") String spage, ModelAndView model){
		int nno = Integer.valueOf(snno);
		int bno = Integer.valueOf(sbno);
		HashMap map = new HashMap();
		map.put("bno", bno);
		map.put("upbno", nno);
		int replyCount = noticeService.getReplyCount(nno);
		List<Notice> nList = noticeService.selectDetailList(map);
		Notice n = noticeService.selectOne(nno);
		model.addObject("snno", snno);
		model.addObject("sbno", sbno);
		model.addObject("spage", spage);
		model.addObject("nList", nList );
		model.addObject("replyCount", replyCount );
		model.addObject("n", n);
		model.setViewName("notice/nDetail");
		return model;
	}
	@RequestMapping("nUpdate.no")
	public String update(Notice notice, @RequestParam("sbno") String sbno ){
		int result = noticeService.update(notice);
		String address = null;
		if(result >0){
			address = "redirect:/nDetail.no?snno" +notice.getNno() +"&sbno="+sbno ;
		}
		return null;
		
	}
	@RequestMapping("nDelete.no")
	public String delete(int nno){
		int result = noticeService.delete(nno);
		String address = null;
		if(result >0){
			address="redirect:/";
		}
			
		
		return address;
	}
	@RequestMapping("nInsert.no")
	public String insert(Notice notice){
		int result = noticeService.insert(notice);
		String address = null;
		if(result >0){
			address ="redirect:/nList.no?sbno=1&spage=1";
		}
		return address;
	}
	
}

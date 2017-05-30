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
	public ModelAndView notice(Notice notice, @RequestParam("page") int page,
								 ModelAndView model){
		HashMap map = new HashMap();
		int sNum = page * 10 +1 -10;
		int eNum = sNum + 9;
		int upbno = 0;
		map.put("bno", notice.getBno());
		map.put("sNum", sNum);
		map.put("eNum", eNum);
		map.put("upbno", 0);
		List<Notice> nList = noticeService.selectList(map);
		int listCount = noticeService.getListCount(notice.getBno(), upbno);
		
		model.addObject("bno", notice.getBno());
		model.addObject("page", page);
		model.addObject("listCount", listCount);
		model.addObject("nList", nList);
		
		model.setViewName("notice/notice");
		return model;
	}
	
	@RequestMapping("nSearchTitle.no")
	public ModelAndView searchTitle(@RequestParam("bno") int bno,
			@RequestParam("page") int page, @RequestParam("nTitle") String nTitle, ModelAndView model){
		HashMap map = new HashMap();
		int listCount = noticeService.getListCountWithTitle(bno, nTitle);
		List<Notice> nList = noticeService.searchTitle(bno, page, nTitle);
		model.addObject("sbno", bno);
		model.addObject("page", page);
		model.addObject("listCount", listCount);
		model.addObject("nList", nList);
		model.setViewName("notice/notice");
		
		return model;
	}
	
	@RequestMapping("nInsertView.no")
	public ModelAndView Write(@RequestParam("bno") int bno, @RequestParam("page") int page, ModelAndView model  ){
		model.addObject("bno", bno );
		model.addObject("page", page );
		model.setViewName("notice/ninsert");
		return model;
	}
	
	@RequestMapping("nDetail.no")
	public ModelAndView selectDetailList(Notice notice,
			@RequestParam("page") String page, ModelAndView model){
		int upReadCount = noticeService.upReadCount(notice.getNno());
		int replyCount = noticeService.getReplyCount(notice.getNno());
		List<Notice> nList = noticeService.selectDetailList(notice.getNno());
		Notice n = noticeService.selectOne(notice.getNno());
		model.addObject("page", page);
		model.addObject("nList", nList );
		System.out.println(nList);
		model.addObject("replyCount", replyCount );
		model.addObject("n", n);
		model.setViewName("notice/nDetail");
	
		return model;
	}
	
	@RequestMapping("goUpdateView.no")
	public ModelAndView goUpdateView(@RequestParam("nno") int nno, @RequestParam("page") int page, ModelAndView model ){
	Notice n = noticeService.selectOne(nno);
	model.addObject("n", n);	
	model.addObject("page", page);
	model.setViewName("notice/noticeUpdateView");
	return model;	
	}
	
	
	@RequestMapping("nUpdate.no")
	public String update(Notice notice, @RequestParam("page") int page){
		int result = noticeService.update(notice);
		String address = null;
		if(result >0){
			if(notice.getNtitle() != null){
			address = "redirect:/nDetail.no?nno=" +notice.getNno() +"&bno="+notice.getBno()+"&page="+page;	
			}else{
				address = "redirect:/nDetail.no?nno=" +notice.getUpbno() +"&bno="+notice.getBno()+"&page="+page;		
			}
			}
		return address;
		
	}
	@RequestMapping("nDelete.no")
	public String delete(Notice notice, ModelAndView model, @RequestParam("page") int page){
		int result = noticeService.delete(notice.getNno());
		String address = null;
		System.out.println(notice);
		if(result >0){
			if(notice.getNtitle() !=null){
			address = "redirect:/nList.no?bno="+notice.getBno()+"&page=1";
			}else{
			address = "redirect:/nDetail.no?nno="+notice.getUpbno()+"&bno="+notice.getBno()+"&page="+page;
			}
		}
		return address;
	}
	@RequestMapping("nInsert.no")
	public String insert(Notice notice, @RequestParam("page") String page){
	
		int result = noticeService.insert(notice);
		String address = null;
		if(result >0){
			if(notice.getNtitle() != null){
			address ="redirect:/nList.no?bno="+ notice.getBno()+ "&page="+page;
			}else{
				address ="redirect:/nDetail.no?bno="+notice.getBno()+"&nno="+notice.getUpbno()+"&page="+page;
			}
		}
		return address;
	}
	
}

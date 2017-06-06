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
		if(notice.getNtitle() == null){
		System.out.println("notice upbno = "+ notice.getUpbno());
		HashMap map = new HashMap();
		int sNum = page * 10 +1 -10;
		int eNum = sNum + 9;
		map.put("bname", notice.getBname());
		map.put("sNum", sNum);
		map.put("eNum", eNum);
		map.put("upbno", notice.getUpbno());
		List<Notice> nList = noticeService.selectList(map);
		int listCount = noticeService.getListCount(notice);
		model.addObject("bname", notice.getBname());
		model.addObject("page", page);
		model.addObject("listCount", listCount);
		model.addObject("nList", nList);
		model.setViewName("notice/notice");
		}
		else if(notice.getNtitle() != null){
			System.out.println("notice get"+ notice.getNtitle());
			HashMap map = new HashMap();
			map.put("bname", notice.getBname());
			int sNum = page * 10 +1 -10;
			int eNum = sNum + 9;
			map.put("sNum", sNum);
			map.put("eNum", eNum);
			map.put("upbno", notice.getUpbno());
			map.put("ntitle", notice.getNtitle());
			int listCount = noticeService.getListCount(notice);
			List<Notice> nList = noticeService.selectList(map);
			model.addObject("bname", notice.getBname());
			model.addObject("page", page);
			model.addObject("listCount", listCount);
			model.addObject("nList", nList);
			model.setViewName("notice/notice");
		}else if(notice.getNickname() != null){
			System.out.println("notice get"+ notice.getNtitle());
			HashMap map = new HashMap();
			map.put("bname", notice.getBname());
			int sNum = page * 10 +1 -10;
			int eNum = sNum + 9;
			map.put("sNum", sNum);
			map.put("eNum", eNum);
			map.put("upbno", notice.getUpbno());
			map.put("nickname", notice.getNickname());
			int listCount = noticeService.getListCount(notice);
			List<Notice> nList = noticeService.selectList(map);
			model.addObject("bname", notice.getBname());
			model.addObject("page", page);
			model.addObject("listCount", listCount);
			model.addObject("nList", nList);
			model.setViewName("notice/notice");
		}
		
		return model;
	}
	
	@RequestMapping("nInsertView.no")
	public ModelAndView Write(@RequestParam("bname") String bname, @RequestParam("page") int page, ModelAndView model  ){
		model.addObject("bname", bname );
		model.addObject("page", page );
		model.setViewName("notice/ninsert");
		return model;
	}
	
	@RequestMapping("nDetail.no")
	public ModelAndView selectDetailList(Notice notice,
			@RequestParam("page") int page, ModelAndView model){
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
			address = "redirect:/nDetail.no?nno=" +notice.getNno() +"&bname="+notice.getBname()+"&page="+page;	
			}else{
				address = "redirect:/nDetail.no?nno=" +notice.getUpbno() +"&bname="+notice.getBname()+"&page="+page;		
			}
			}
		return address;
		
	}
	@RequestMapping("nDelete.no")
	public String delete(Notice notice, ModelAndView model, @RequestParam("page") int page){
		int result = noticeService.delete(notice.getNno());
		String address = null;
		if(result >0){
			if(notice.getNtitle() !=null){
			address = "redirect:/nList.no?bname="+notice.getBname()+"&page=1";
			}else{
			address = "redirect:/nDetail.no?nno="+notice.getUpbno()+"&bname="+notice.getBname()+"&page="+page;
			}
		}
		return address;
	}
	@RequestMapping("nInsert.no")
	public ModelAndView insert(Notice notice, @RequestParam("page") int page, ModelAndView model){
		
		int result = noticeService.insert(notice);
		String address = null;
		if(result >0){
			if(notice.getNtitle() != null){
			model = notice(notice, page, model);
			}else{
				notice.setNno(notice.getUpbno());
				model = selectDetailList(notice, page, model);
			}
		}
		return model;
	}
	
}

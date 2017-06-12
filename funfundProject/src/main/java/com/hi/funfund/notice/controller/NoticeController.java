package com.hi.funfund.notice.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.notice.model.service.NoticeService;
import com.hi.funfund.notice.model.vo.Notice;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	
	@RequestMapping(value="nList.no",  method=RequestMethod.GET)
	public ModelAndView notice(Notice notice, @RequestParam("page") int page,
								 ModelAndView model){
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
	public ModelAndView delete(Notice notice, ModelAndView model, @RequestParam("page") int page){
		System.out.println("notice : "+notice);
		int result = noticeService.delete(notice.getNno());
		if(result >0){
			if(notice.getNtitle() !=null){
			model.addObject("message","본글삭제" );
			}else{
			model.addObject("message","댓글삭제" );
			}
			model.setViewName("jsonView");
		}
		return model;
	}
	@RequestMapping("nInsert.no")
	public ModelAndView insert(Notice notice, @RequestParam("page") String page){
		notice.setNcontent( notice.getNcontent().replaceAll("\"", "\'"));
		int result = noticeService.insert(notice);
		String address = null;
		notice.setNtitle(null);
		ModelAndView modela = new ModelAndView();
		ModelAndView model = null;
		if(result >0){
			model = notice(notice, Integer.valueOf(page), modela);
			
		}
		return model;
	}
	@RequestMapping("replyInsert.no")
	public @ResponseBody List<Notice> insertReply(Notice notice, @RequestParam("page") int page){
		int result = noticeService.insert(notice);
		int upbno = notice.getUpbno();
		List<Notice> nList = noticeService.selectDetailList(upbno);
		return nList;
	}
	
}

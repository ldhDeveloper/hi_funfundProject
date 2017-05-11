package com.hi.funfund.pupdate.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.pupdate.model.service.PupdateService;
import com.hi.funfund.pupdate.model.vo.Pupdate;

@Controller

public class PupdateController {
	
	@Autowired
	private PupdateService pUpdateService;
	
	
	public String insert(Pupdate pUpdate){
		int result = pUpdateService.insert(pUpdate);
		return null;
	}
	
	
	public String update(Pupdate pUpdate){
		int result = pUpdateService.update(pUpdate);
		
		return null;
	}
	
	public String delete(int upno){
		int result = pUpdateService.delete(upno);
		
		return null;
	}
	
		public String selectList(int pro_no, ModelAndView model){
		
		List<Pupdate> pList = pUpdateService.selectList(pro_no);
				
			return null;
		}	
	
}

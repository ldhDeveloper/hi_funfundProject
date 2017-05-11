package com.hi.funfund.attachment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.attachment.model.service.AttachmentService;
import com.hi.funfund.attachment.model.vo.Attachment;

@Controller

public class AttachmentController {

	@Autowired
	private AttachmentService attachmentService;
	
	public String insert(Attachment attachment){
		
		int result = attachmentService.insert(attachment);
		
		return null;
	}
	
	public String delete(int fno){
		
		int result = attachmentService.delete(fno);
		
		return null;
	}
	public ModelAndView selectList(int ref_no, ModelAndView model){
		
		List<Attachment> AttachmentList = attachmentService.selectList(ref_no); 
		
		return model;
	}
	
	public String downLoad(Attachment attachment){
		return null;
	}
	
}

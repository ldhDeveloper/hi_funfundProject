package com.hi.funfund.attachment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.funfund.attachment.model.service.AttachmentService;

@Controller
@RequestMapping("attachment")
public class AttachmentController {

	@Autowired
	private AttachmentService attachmentService;
	
	
	
}

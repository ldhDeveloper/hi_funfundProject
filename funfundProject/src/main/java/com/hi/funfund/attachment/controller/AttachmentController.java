package com.hi.funfund.attachment.controller;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.account.model.service.AccountService;
import com.hi.funfund.account.model.vo.Account;
import com.hi.funfund.attachment.model.service.AttachmentService;
import com.hi.funfund.attachment.model.vo.Attachment;

@Controller

public class AttachmentController {

	@Autowired
	private AttachmentService attachmentService;

	public String insert(Attachment attachment) {

		int result = attachmentService.insert(attachment);

		return null;
	}

	public String delete(int fno) {

		int result = attachmentService.delete(fno);

		return null;
	}

	public ModelAndView selectList(int ref_no, ModelAndView model) {

		List<Attachment> AttachmentList = attachmentService.selectList(ref_no);

		return model;
	}

	public String downLoad(Attachment attachment) {
		return null;
	}

	// myinfo 사진업로드 시작

	@RequestMapping(value = "/imgUpload.at")
	public String insertImgMyProfile(Attachment attachment, HttpServletRequest request) throws IOException{
		//파일 업로드 처리
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		MultipartFile uploadFile = multipartRequest.getFile("uploadFile");
		
		// 웹서버 컨테이너 경로 추출함 
		String root = request.getSession().getServletContext().getRealPath("/");
		    
		// 파일 저장 경로 정함
		String savePath = root + "uploadFiles/";
		    
		// 스프링에서는 프로젝트\target\m2e-wtp\web-resources\ 아래에 폴더를 만들어야 함
		// \target\m2e-wtp\web-resources\UPloadFiles\images\myprofile
		// 임의의 폴더를 정해서 지정해도 됨
		    
		if(!uploadFile.isEmpty()){
			String orifname = uploadFile.getOriginalFilename();
			
			long currentTime = System.currentTimeMillis();
			SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
			String refname = simDf.format(new Date(currentTime)) + "." + orifname.substring(orifname.lastIndexOf(".")+1);
			uploadFile.transferTo(new File(savePath + refname));
			
			attachment.setOrifname(orifname);
			attachment.setRefname(refname);
			HttpSession session = request.getSession(false);
			Account account = (Account)session.getAttribute("account");
			attachment.setRefno(account.getAno());
		}
		
		int result = attachmentService.insertImgMyProfile(attachment);
		return "myinfo.ao";
	}

	// myinfo 사진업로드 끝

}

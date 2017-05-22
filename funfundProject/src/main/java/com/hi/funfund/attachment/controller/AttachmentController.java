package com.hi.funfund.attachment.controller;

import java.io.*;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.account.model.service.AccountService;
import com.hi.funfund.account.model.vo.Account;
import com.hi.funfund.account.model.vo.Party;
import com.hi.funfund.attachment.model.service.AttachmentService;
import com.hi.funfund.attachment.model.vo.Attachment;

@Controller

public class AttachmentController {

	@Autowired
	private AttachmentService attachmentService;

	@Autowired
	private AccountService accountService;
	
	@RequestMapping("/imgUpload.at")
	public String imgUpload(Attachment vo, HttpServletRequest request) throws  IOException{
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		MultipartFile uploadFile = multipartRequest.getFile("uploadFile");
		HttpSession session = request.getSession(false);
		/*File file = new File("..\..\weapp");
		String root = file.getCanonicalPath().toString();*/
		String page="";
		
		String photoflag = request.getParameter("photoflag");
		System.out.println("photoflag = " + photoflag);
		
		String root = request.getSession().getServletContext().getRealPath("/");
		System.out.println("root : " + root);
		String[] roots = root.split("\\\\");
		String marger="";
		for(int i=0 ; i<roots.length-3; i++){
			marger += roots[i] + "\\";
		}
		System.out.println("marger : " + marger);
		String savePath = marger + "src/main/webapp/images/myinfo/";
		System.out.println("savepath : " + savePath);
		int ano=0;
		int result=0;
		if(!uploadFile.isEmpty()){
			String ofileName = uploadFile.getOriginalFilename();
			
			long currentTime = System.currentTimeMillis();  
		    SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
			String rfileName = simDf.format(new Date(currentTime)) +"."
					+ ofileName.substring(ofileName.lastIndexOf(".")+1);;
			uploadFile.transferTo(new File(savePath + rfileName));
			Account ac = (Account)session.getAttribute("account");
			ano = ac.getAno();
			vo.setOrifname(ofileName);
			vo.setRefname(rfileName);
			vo.setFtype("account");
			vo.setFsubtype("profileimage");
			vo.setRefno(ano);
			if(photoflag.equals("insert")){
				result = attachmentService.insertProfileImage(vo);
				System.out.println("insert 발생");
			}
			if(photoflag.equals("update")){
				result = attachmentService.updateProfileImage(vo);
				System.out.println("insert 발생");
			}
			if(result > 0){
				HashMap<String, String> hmap = new HashMap<String, String>();
				hmap.put("ano", Integer.toString(ano));
				hmap.put("pimage", rfileName);
				result = attachmentService.accountProfileImage(hmap);
				if(result > 0){
					Account a = accountService.selectAccount(ano);
					session = request.getSession(false);
					session.setAttribute("account", a);	
				} else {
					System.out.println("업로드 실패");
				}
				
			}
		}	
		return "home";
	}
	
	@RequestMapping("/insertSlide.at")
	public ModelAndView insertSlideImages( ModelAndView model, HttpServletRequest request ,@RequestParam("pro_no")int pro_no) throws  IOException{
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		HttpSession session = request.getSession(false);
		String positions = request.getParameter("positions");
		
		System.out.println(pro_no);
		
		String[] fnum = positions.split(";");
		
		String page = "";
		ArrayList<Integer> farr = new ArrayList<Integer>();
		String root = request.getSession().getServletContext().getRealPath("/");
		System.out.println("root : " + root);
		String[] roots = root.split("\\\\");
		String marger = "";
		for (int i = 0; i < roots.length - 3; i++) {
			marger += roots[i] + "\\";
		}

		System.out.println("marger : " + marger);
		String savePath = marger + "src/main/webapp/images/makeproject/slideimg/";
		System.out.println("savepath : " + savePath);

		
		Iterator<String> files = multipartRequest.getFileNames();
		
		System.out.println(files);
		int i = 0;
		
		while(files.hasNext()) {
			System.out.println("오니?");
			
			String uploadFile = files.next();
			System.out.println(uploadFile);
			MultipartFile mFile = multipartRequest.getFile(uploadFile);
			
			
			int result2 = 0;
			String ofileName = mFile.getOriginalFilename();

			long currentTime = System.currentTimeMillis();
			SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
			String rfileName = simDf.format(new Date(currentTime)) + "(" + i + ")."
					+ ofileName.substring(ofileName.lastIndexOf(".") + 1);
			
			Attachment att = new Attachment();
			
			att.setOrifname(ofileName);
			att.setRefname(rfileName);
			att.setFtype("item");
			att.setFsubtype("slideimg");
			att.setFnum(Integer.parseInt(fnum[i]));
			att.setRefno(pro_no);
			
			System.out.println(i);
			
			result2 = attachmentService.insertSlideImages(att);
			
			farr.add(result2);
			
			i++;
			try {
				mFile.transferTo(new File(savePath + rfileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
			
		}
		
		
		model.addObject("farr", farr);

		model.setViewName("jsonView");

		return model;
	}
	
	
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


}

package com.hi.funfund.item.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hi.funfund.HomeController;
import com.hi.funfund.account.model.vo.Account;
import com.hi.funfund.attachment.model.service.AttachmentService;
import com.hi.funfund.attachment.model.vo.Attachment;
import com.hi.funfund.fundmenu.model.service.FundMenuService;
import com.hi.funfund.fundmenu.model.vo.FundMenu;
import com.hi.funfund.fundmenu.model.vo.ReciveFundMenu;
import com.hi.funfund.item.model.service.ItemService;
import com.hi.funfund.item.model.service.ItemServiceIm;
import com.hi.funfund.item.model.vo.Item;
import com.hi.funfund.item.model.vo.Itemfund;
import com.hi.funfund.itemask.model.service.ItemAskService;
import com.hi.funfund.itemask.model.vo.ItemAsk;

@Controller

public class ItemController {

	@Autowired
	private ItemService itemService;
	@Autowired
	private FundMenuService fundMenuService;
	@Autowired
	private ItemAskService itemAskService;
	@Autowired
	private AttachmentService attachmentService;


	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@InitBinder
	public void binder(WebDataBinder binder) {
	    DateFormat dateOnlyFormat = new SimpleDateFormat("dd/MM/yyyy");
	    dateOnlyFormat.setLenient(true);
	    binder.registerCustomEditor(Date.class, "dataInicio", new CustomDateEditor(dateOnlyFormat, true));
	}

	public ModelAndView AllList(ModelAndView model) {
		List<Item> mList = itemService.AllList();
		return model;
	}

	public ModelAndView rewardingList(ModelAndView model) {

		List<Item> mList = itemService.rewardingList();

		return model;
	}

	public ModelAndView donationList(ModelAndView model) {

		List<Item> mList = itemService.donationList();
		return model;
	}

	public ModelAndView selectFunddingList(ModelAndView model) {

		return model;
	}

	public ModelAndView PickList(ModelAndView model) {

		return model;
	}

	public ModelAndView selectMyList(int pro_no, ModelAndView model) {

		return model;
	}

	public ModelAndView selectRecommendList(ModelAndView model) {

		return model;
	}

	public ModelAndView categoryList(ModelAndView model) {

		return model;
	}

	public ModelAndView searchItemWriter(ModelAndView model) {

		return model;
	}

	public ModelAndView searchItemTitle(ModelAndView model) {

		return model;
	}

	public ModelAndView selectOne(ModelAndView model) {

		return model;
	}

	public ModelAndView selectOngoingItemList(ModelAndView model) {

		return model;
	}

	public ModelAndView selectEndItemList(ModelAndView model) {

		return model;
	}

	public ModelAndView getGrowRate(ModelAndView model) {

		return model;
	}

	@RequestMapping("insert.it")
	public ModelAndView insertRewardItem(ModelAndView model, HttpSession session, HttpServletRequest request, @RequestParam("ano") int ano) {
		//int ano = Integer.parseInt(request.getParameter("ano"));
		System.out.println("ano : " + ano);
		Item item = new Item();
		item.setAno(ano);
		int pro_no=0;

		if("TRUE".equals(request.getAttribute("TOKEN_SAVE_CHECK"))) {
			 pro_no = itemService.insertRewardItem(item);
			 int ii = attachmentService.insertItemImages(pro_no);
		} else {
			  // 중복 요청이므로 그에 따른 로직 작성
		}

		
		
		
		
		request.setAttribute("ano", ano);
		request.setAttribute("pro_no", pro_no);
		

		model.setViewName("makeproject/primaryinfo");
		
		return model;
	}

	@RequestMapping("insertReward.it")
	public ModelAndView insertRewardItem(ModelAndView model, FundMenu fmenu) {
		System.out.println(fmenu);
		ArrayList<FundMenu> fmlist = null;

		int result = fundMenuService.insertFundMenu(fmenu);

		if (result > 0) {
			fmlist = fundMenuService.selectList(fmenu.getPro_no());
			model.setViewName("jsonView");
			model.addObject("fmlist", fmlist);
			System.out.println("fmlist : " + fmlist);
		}

		return model;
	}

	
	@RequestMapping(value ="selectAll.it", method = RequestMethod.GET)
	public @ResponseBody List<Item> selectAllItem() {
		List<Item> iList = itemService.AllList();
		System.out.println("오니?");
		if(iList != null){
			System.out.println("iList : " + iList);
		}	
		return iList;
	}
	
	@RequestMapping(value ="selectCategory.it", method = RequestMethod.GET)
	public @ResponseBody List<Item> selectCategoryItem(@RequestParam("category") String category) {
		System.out.println("category : " + category);
		List<Item> iList = itemService.categoryList(category);
		System.out.println("오니?");
		if(iList != null){
			System.out.println("iList : " + iList);
		}	
		return iList;
	}

	@RequestMapping(value = "update.it", method = RequestMethod.POST)
	public ModelAndView insertRewardItem(ModelAndView model, Item item, HttpServletRequest request) {
		int result = 0;
		
		String[] psdates = item.getS_psdate().split("-");
		String s_psdate = psdates[0] + psdates[1] + psdates[2];
		item.setS_psdate(s_psdate);
		String[] pedates = item.getS_pedate().split("-");
		String s_pedate = pedates[0] + pedates[1] + pedates[2];
		item.setS_pedate(s_pedate);
		
		System.out.println(s_psdate);
		System.out.println(s_pedate);
		
		result = itemService.updateRewardItem(item);
		

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile uploadFile = multipartRequest.getFile("uploadFile");
		MultipartFile uploadFile2 = multipartRequest.getFile("uploadFile2");
		
		if (!uploadFile.isEmpty()) {

			HttpSession session = request.getSession(false);

			String page = "";
			String root = request.getSession().getServletContext().getRealPath("/");
			System.out.println("root : " + root);
			String[] roots = root.split("\\\\");
			String marger = "";
			for (int i = 0; i < roots.length - 3; i++) {
				marger += roots[i] + "\\";
			}

			System.out.println("marger : " + marger);
			String savePath = marger + "src/main/webapp/images/makeproject/titleimg/";
			System.out.println("savepath : " + savePath);

			int result2 = 0;
			String ofileName = uploadFile.getOriginalFilename();

			long currentTime = System.currentTimeMillis();
			SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
			String rfileName = simDf.format(new Date(currentTime)) + "(1)."
					+ ofileName.substring(ofileName.lastIndexOf(".") + 1);
			;
			try {
				uploadFile.transferTo(new File(savePath + rfileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			Attachment att = new Attachment();
			
			att.setOrifname(ofileName);
			att.setRefname(rfileName);
			att.setFtype("item");
			att.setFsubtype("titleimg");
			att.setRefno(item.getPro_no());
			
			result2 = attachmentService.updateTitleImage(att);
			
		}
		
		if (!uploadFile2.isEmpty()) {

			HttpSession session = request.getSession(false);

			String page = "";
			String root = request.getSession().getServletContext().getRealPath("/");
			System.out.println("root : " + root);
			String[] roots = root.split("\\\\");
			String marger = "";
			for (int i = 0; i < roots.length - 3; i++) {
				marger += roots[i] + "\\";
			}

			System.out.println("marger : " + marger);
			String savePath = marger + "src/main/webapp/images/makeproject/makerimg/";
			System.out.println("savepath : " + savePath);

			int result2 = 0;
			String ofileName = uploadFile2.getOriginalFilename();

			long currentTime = System.currentTimeMillis();
			SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
			String rfileName = simDf.format(new Date(currentTime)) + "(2)."
					+ ofileName.substring(ofileName.lastIndexOf(".") + 1);
			;
			try {
				uploadFile2.transferTo(new File(savePath + rfileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			Attachment att = new Attachment();
			
			att.setOrifname(ofileName);
			att.setRefname(rfileName);
			att.setFtype("item");
			att.setFsubtype("makerimg");
			att.setRefno(item.getPro_no());
			
			result2 = attachmentService.updateMakerImage(att);
			
		}
		
		model.addObject("pro_no", item.getPro_no());

		model.setViewName("makeproject/primaryinfo");

		return model;
	}

	@RequestMapping("funding.it")
	public ModelAndView funding(ModelAndView model) {
		List<Item> iList = itemService.AllList();
		model.addObject("iList", iList);
		model.setViewName("funding/funding");
		return model;
	}

	@RequestMapping(value = "detail.it")
	public ModelAndView fundingdetailList(ModelAndView model, HttpServletRequest request) {
		int pro_no = Integer.parseInt(request.getParameter("pro_no"));
		Item item = itemService.selectOne(pro_no);
		List<Itemfund> bestList = itemService.bestList(pro_no);
		List<FundMenu> mList = fundMenuService.selectList(pro_no);
		List<ItemAsk> aList = itemAskService.selectList(pro_no);
		//youtube 주소
		String vaddress = item.getPvideo();
		String[] pvideoAddress = vaddress.split("/");
		vaddress = pvideoAddress[pvideoAddress.length - 1];
		
		item.setPvideo(vaddress);
		model.addObject("item", item);
		model.addObject("mList", mList);
		model.addObject("aList", aList);
		model.addObject("bestList", bestList);
		model.setViewName("funding/detailList");
		return model;
	}

}

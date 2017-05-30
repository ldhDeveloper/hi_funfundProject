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

	

	@RequestMapping("insert.it")
	public ModelAndView insertRewardItem(ModelAndView model, HttpSession session, HttpServletRequest request,
			@RequestParam("ano") int ano) {
		// int ano = Integer.parseInt(request.getParameter("ano"));
		System.out.println("ano : " + ano);
		Item item = new Item();
		item.setAno(ano);

		int pro_no = itemService.insertRewardItem(item);

		int ii = attachmentService.insertItemImages(pro_no);

		request.setAttribute("ano", ano);
		request.setAttribute("pro_no", pro_no);

		model.setViewName("redirect:/update.it?pro_no=" + pro_no + "&flag=true");

		return model;
	}

	@RequestMapping("insertReward.it")
	public ModelAndView insertRewardItem(ModelAndView model, FundMenu fmenu) {
		System.out.println(fmenu);
		ArrayList<FundMenu> fmlist = null;
		if (!fmenu.getS_mdate().equals("")) {
			String[] mdates = fmenu.getS_mdate().split("-");
			String s_mdate = mdates[0] + mdates[1] + mdates[2];
			fmenu.setS_mdate(s_mdate);
		}
		int result = fundMenuService.insertFundMenu(fmenu);

		if (result > 0) {
			fmlist = fundMenuService.selectList2(fmenu.getPro_no());
			model.setViewName("jsonView");
			model.addObject("fmlist", fmlist);
			System.out.println("fmlist : " + fmlist);
		}

		return model;
	}

	@RequestMapping(value = "selectAll.it", method = RequestMethod.GET)
	public @ResponseBody List<Item> selectAllItem() {
		List<Item> iList = itemService.AllList();
		System.out.println("오니?");
		if (iList != null) {
			System.out.println("iList : " + iList);
		}
		return iList;
	}

	@RequestMapping(value = "selectCategory.it", method = RequestMethod.GET)
	public @ResponseBody List<Item> selectCategoryItem(@RequestParam("category") String category) {
		System.out.println("category : " + category);
		List<Item> iList = itemService.categoryList(category);
		System.out.println("오니?");
		if (iList != null) {
			System.out.println("iList : " + iList);
		}
		return iList;
	}

	@RequestMapping(value = "update.it", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView insertRewardItem(ModelAndView model, Item item, HttpServletRequest request) {
		int result = 0;
		String flag = request.getParameter("flag");
		System.out.println(flag);
		System.out.println(item);
		if (flag.equals("false")) {
			System.out.println("오니?");
			result = itemService.updateRewardItem(item);
			System.out.println("날짜" + item.getS_psdate() + "일");
			if (!item.getS_psdate().equals("")) {
				String[] psdates = item.getS_psdate().split("-");
				String s_psdate = psdates[0] + psdates[1] + psdates[2];
				item.setS_psdate(s_psdate);
			}

			if (!item.getS_pedate().equals("")) {
				String[] pedates = item.getS_pedate().split("-");
				String s_pedate = pedates[0] + pedates[1] + pedates[2];
				item.setS_pedate(s_pedate);
			}

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
				att.setFsubtype("thumbnail");
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
		}

		model.addObject("pro_no", item.getPro_no());

		model.setViewName("makeproject/primaryinfo");

		return model;
	}
	@RequestMapping(value = "updateajax.it", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updateAjaxItem(ModelAndView model, Item item, HttpServletRequest request){
		
		System.out.println(item);
		
		if (!item.getS_psdate().equals("")) {
			String[] psdates = item.getS_psdate().split("-");
			String s_psdate = psdates[0] + psdates[1] + psdates[2];
			item.setS_psdate(s_psdate);
		}

		if (!item.getS_pedate().equals("")) {
			String[] pedates = item.getS_pedate().split("-");
			String s_pedate = pedates[0] + pedates[1] + pedates[2];
			item.setS_pedate(s_pedate);
		}
		
		int result = itemService.updateRewardItem(item);
		System.out.println("날짜변환 : " + item);
		
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
		List<Attachment> sList = attachmentService.selectimgList(pro_no);
		if (item.getPvideo() != null || item.getPvideo() == "") {
			// youtube 주소
			String vaddress = item.getPvideo();
			String[] pvideoAddress = vaddress.split("/");
			vaddress = pvideoAddress[pvideoAddress.length - 1];
			item.setPvideo(vaddress);
		};
		model.addObject("item", item);
		model.addObject("mList", mList);
		model.addObject("aList", aList);
		model.addObject("bestList", bestList);
		model.addObject("sList", sList);
		model.setViewName("funding/detailList");
		return model;
	}

}

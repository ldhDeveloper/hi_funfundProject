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
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.view.RedirectView;

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
		item.setRefund("§업체명/메이커명§은 펀딩해주신 서포터분들께 감사의 표시인 리워드 제공 일정을 준수하기 위해 최선을 다할 것을 약속합니다.^"
+ " ^" + " ^"
+ "단, 펀딩을 받아야만 생산을 시작할 수 있는 크라우드펀딩 특성 및 생산과정에서의 예상치못한 상황으로 인하여 리워드 제공일이 다소 지연될 수 있는 점을 알려 드립니다.^"
+ " ^" + " ^"
+ "약속된 발송일 (yyyy-mm-dd)으로부터 1달 이내 (yyyy-mm-dd) 리워드 제공이 지연될 경우-리워드 제공 지연이 예상되는 시점에 즉시 새소식과 SMS으로 변경된 리워드 제공일을 알려 드립니다.-단, 리워드 제공 지연 사유로 인한 펀딩 취소는 불가합니다.^"
+ " ^" + " ^"
+ "약속된 발송일 (yyyy-mm-dd)으로부터 1달 이상 (yyyy-mm-dd) 리워드 제공이 지연될 경우-리워드 제공 지연이 예상되는 시점에 즉시 새소식과 SMS으로 변경된 리워드 제공일을 알려 드립니다.^"
+ "-§리워드금액§에 해당하는 §리워드명§에 해당하는 추가 리워드를 함께 보내드립니다.^"
+ "-예상보다 리워드 제공이 많이 지연되었으므로 §메이커 이메일주소§ 으로 신청해주신 서포터에 한해 펀딩하신 금액의 100%를 본인의 계좌로 환불해 드립니다.^"
+ " ^" + " ^"
+ "해당 프로젝트의 교환/반품/AS 정책은 다음과 같습니다.^"
+ "-펀딩 기간에는 자유롭게 마이페이지에서 펀딩 취소 가능하지만,펀딩 기간 이후, 단순 변심으로 인한 교환이나 환불은 불가합니다.^"
+ "-리워드 수령 **일 이내 제품 하자로 인한 교환/반품/AS는 §메이커 이메일주소§으로 신청 가능합니다.");
		
		System.out.println("refund : "+ item.getRefund());
		
		
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
		if(request.getParameter("preview") != null){
			model.addObject("preview", true);
		}
		
		model.addObject("item", item);
		model.addObject("mList", mList);
		model.addObject("aList", aList);
		model.addObject("bestList", bestList);
		model.addObject("sList", sList);
		model.setViewName("funding/detailList");
		return model;
	}
	
	@RequestMapping(value="selectone.it")
	public ModelAndView selectOne(@RequestParam("pro_no") int pro_no, ModelAndView model, HttpServletRequest request, HttpServletResponse response){
		Item item = itemService.selectOneForUpdate(pro_no);
		HashMap<String, String> amap = (HashMap<String, String>) attachmentService.selectTempImage(pro_no);
		System.out.println("start select : " + item);
		model.addObject("item", item);
		model.addObject("images", amap);
		model.setViewName("jsonView");
		
		return model;
	}
	
	@RequestMapping(value="checkproject.it")
	public ModelAndView selectItemList(@RequestParam("ano") int ano, ModelAndView model, HttpServletRequest request, HttpServletResponse response){
		
		System.out.println("ano : " + ano);
		
		List<Item> plist = itemService.selectItemList(ano);
		
		System.out.println("plist : " + plist);
		
		model.setViewName("jsonView");
		model.addObject("plist", plist);
		
		return model;
	}
	
	
	
	@RequestMapping(value="checkaccount.it")
	public ModelAndView updateAcc(ModelAndView model, Item item, HttpServletRequest request, HttpServletResponse response){
		System.out.println("계좌등록 : " + item);
		
		int result = itemService.updateAcc(item);
		
		model.setViewName("redirect:/update.it?pro_no=" + item.getPro_no() + "&flag=true");
		
		return model;
	}
	
	
	@RequestMapping(value="updateStatus.it")
	public ModelAndView updateStatus(ModelAndView model, Item item, HttpServletRequest request, HttpServletResponse response){
		System.out.println("계좌등록 : " + item);
		
		int result = itemService.updateStatus(item);
		
		model.setViewName("redirect:/update.it?pro_no=" + item.getPro_no() + "&flag=true");
		
		return model;
	}
}

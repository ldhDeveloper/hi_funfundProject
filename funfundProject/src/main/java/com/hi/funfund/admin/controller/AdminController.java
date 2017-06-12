package com.hi.funfund.admin.controller;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.account.model.service.AccountService;
import com.hi.funfund.account.model.vo.Account;
import com.hi.funfund.account.model.vo.Party;
import com.hi.funfund.admin.model.service.AdminService;
import com.hi.funfund.admin.model.vo.AccInfo;
import com.hi.funfund.admin.model.vo.CancelInfo;
import com.hi.funfund.admin.model.vo.ProfitHash;
import com.hi.funfund.admin.model.vo.ProfitInfo;
import com.hi.funfund.alert.model.service.AlertService;
import com.hi.funfund.alert.model.vo.Alert;
import com.hi.funfund.item.model.service.ItemService;
import com.hi.funfund.item.model.vo.Item;

@Controller
public class AdminController {

	@Autowired
	private ItemService itemService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private AlertService alertService;
	
	@RequestMapping("/itemconfirm.am")
	public ModelAndView selectRequestItem(ModelAndView mv, HttpServletRequest request){
		List<Item> alist = itemService.selectRequestItem();
		
		mv.addObject("alist", alist);
		mv.setViewName("admin/itemconfirm");
		return mv;
	}
	
	@RequestMapping("/successFundding.am")
	public ModelAndView selectSuccessItem(ModelAndView mv, HttpServletRequest request){
		List<Item> alist = itemService.selectSuccessItem();
		
		mv.addObject("alist", alist);
		mv.setViewName("admin/funddingSuccess");
		return mv;
	}
	
	@RequestMapping("/requestdeleteitem.am")
	public ModelAndView selectDeleteRequest(ModelAndView mv, HttpServletRequest request){
		List<Item> alist = itemService.selectDeleteRequest();
		
		mv.addObject("alist", alist);
		mv.setViewName("admin/requestDeleteItem");
		return mv;
	}
	
	@RequestMapping("/resultitem.am")
	public ModelAndView selectEndItem(ModelAndView mv, HttpServletRequest request){
		List<Item> alist = itemService.selectEndItem();
		
		mv.addObject("alist", alist);
		mv.setViewName("admin/funddingResult");
		return mv;
	}
	
	@RequestMapping(value ="/confirmstatus.am", method = RequestMethod.POST)
	public @ResponseBody int updateConfirmStatus(@RequestParam("pro_no") String prono){
		int pro_no = Integer.parseInt(prono);
		int result = itemService.updateConfirmStatus(pro_no);
		Item item = itemService.selectOne(pro_no);
		int ano = item.getAno();
		String pname = item.getPname();
		Alert al = new Alert();
		al.setAl_title(pname + " 프로젝트 승인");
		al.setAl_content(pname + "프로젝트가 승인되었습니다.");
		al.setAno(ano);
		result += alertService.insertAlert(al);
		return result;
	}
	
	@RequestMapping(value ="/rejectstatus.am", method = RequestMethod.POST)
	public @ResponseBody int updateRejectStatus(@RequestParam("pro_no") String pro_no, @RequestParam("comment") String comment){
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("pro_no", pro_no);
		hmap.put("comment", comment);
		int result = itemService.updateRejectStatus(hmap);
		Item item = itemService.selectOne(Integer.parseInt(pro_no));
		int ano = item.getAno();
		String pname = item.getPname();
		Alert al = new Alert();
		al.setAl_title(pname + " 프로젝트 거부");
		al.setAl_content(pname + "프로젝트가 거부되었습니다.");
		al.setAno(ano);
		result += alertService.insertAlert(al);
		return result;
	}
	
	@RequestMapping(value ="/deletestatus.am", method = RequestMethod.POST)
	public @ResponseBody int updateDeleteStatus(@RequestParam("pro_no") String pro_no, @RequestParam("comment") String comment){
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("pro_no", pro_no);
		hmap.put("comment", comment);
		int result = itemService.updateDeleteStatus(hmap);
		Item item = itemService.selectOne(Integer.parseInt(pro_no));
		int ano = item.getAno();
		String pname = item.getPname();
		Alert al = new Alert();
		al.setAl_title(pname + " 프로젝트 삭제승인");
		al.setAl_content(pname + "프로젝트가 삭제가 승인되었습니다.");
		al.setAno(ano);
		result += alertService.insertAlert(al);
		return result;
	}
	
	@RequestMapping(value ="/successstatus.am", method = RequestMethod.POST)
	public @ResponseBody int updateSuccessStatus(@RequestParam("pro_no") String prono){
		int pro_no = Integer.parseInt(prono);
		System.out.println("pro_no : " + pro_no);
		int result = itemService.updateSuccessStatus(pro_no);
		Item item = itemService.selectOne(pro_no);
		int ano = item.getAno();
		String pname = item.getPname();
		Alert al = new Alert();
		al.setAl_title(pname + " 프로젝트 펀딩성공");
		al.setAl_content(pname + "프로젝트의 펀딩이 성공하였습니다.");
		al.setAno(ano);
		result += alertService.insertAlert(al);
		return result;
	}
	
	@RequestMapping(value ="/failstatus.am", method = RequestMethod.POST)
	public @ResponseBody int updateFailStatus(@RequestParam("pro_no") String pro_no, @RequestParam("comment") String comment){
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("pro_no", pro_no);
		hmap.put("comment", comment);
		int result = itemService.updateFailStatus(hmap);
		Item item = itemService.selectOne(Integer.parseInt(pro_no));
		int ano = item.getAno();
		String pname = item.getPname();
		Alert al = new Alert();
		al.setAl_title(pname + " 프로젝트 펀딩실패");
		al.setAl_content(pname + "프로젝트의 펀딩이 실패하였습니다.");
		al.setAno(ano);
		result += alertService.insertAlert(al);
		return result;
	}
	
	@RequestMapping(value ="/changeBillStatus.am", method = RequestMethod.POST)
	public @ResponseBody int changeBillStatus(@RequestParam("pro_no") String pro_no, @RequestParam("firstprice") String firstprice, @RequestParam("secondprice") String secondprice){
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("pro_no", pro_no);
		hmap.put("firstprice", firstprice);
		hmap.put("secondprice", secondprice);
		int result = itemService.changeBillStatus(hmap);
		return result;
	}
	@RequestMapping(value ="/sellerconfirm.am")
	public ModelAndView selectRequestSeller(ModelAndView model){
		List<AccInfo> acList = adminService.selectRequestSeller();
		model.addObject("acList", acList);
		model.setViewName("admin/confirmSeller");
		return model;
	}
	
	@RequestMapping(value ="/cancelpayment.am")
	public ModelAndView selectCancelInfo(ModelAndView model){
		List<CancelInfo> cList = adminService.selectCancelInfo();
		model.addObject("cList", cList);
		model.setViewName("admin/cancelPayment");
		return model;
	}
	
	@RequestMapping("/pastFundding.am")
	public ModelAndView selectdefaultpast(ModelAndView model){
		Calendar today = Calendar.getInstance();
		String year = Integer.toString(today.get(Calendar.YEAR));
		String month = Integer.toString(today.get(Calendar.MONTH) + 1);
		String dDate = year + "-" + month;		
		List<Item> iList = itemService.selectdefaultpast(dDate);
		model.addObject("iList", iList);
		model.setViewName("admin/pastFundding");
		return model;
	}
	
	@RequestMapping(value ="/endeditemsearch.am", method = RequestMethod.POST)
	public @ResponseBody List<Item> endeditemsearch(@RequestParam("year") String year, @RequestParam("month") String month){
		HashMap<String, String> hmap = new HashMap<String, String>();
		List<Item> iList = new ArrayList<Item>();
		String period="";
		String speriod ="";
		String eperiod ="";
		if(!month.equals("전체보기")){
			period = year + "-0" + month;
			iList = itemService.endeditemsearch(period);
		} else {
			speriod = year + "-01";
			eperiod = year + "-12";
			hmap.put("speriod", speriod);
			hmap.put("eperiod", eperiod);
			iList = itemService.yearitemsearch(hmap);
		}
		
		
		return iList;
	}
	
	@RequestMapping(value = "/approveSeller.am", method = RequestMethod.POST)
	public @ResponseBody int approveSeller(@RequestParam("ano") String anum){
		int ano = Integer.parseInt(anum);
		int result = accountService.approveSeller(ano);
		Alert al = new Alert();
		al.setAl_title("판매자 변경 승인");
		al.setAl_content("판매자 등급변경 요청이 승인되었습니다.");
		al.setAno(ano);
		result += alertService.insertAlert(al);
		return result;
	}
	
	
	@RequestMapping(value = "/rejectSeller.am", method = RequestMethod.POST)
	public @ResponseBody int rejectSeller(@RequestParam("ano") String anum){
		int ano = Integer.parseInt(anum);
		int result = accountService.rejectSeller(ano);
		Alert al = new Alert();
		al.setAl_title("판매자 변경 거부");
		al.setAl_content("판매자 등급변경 요청이 거부되었습니다.");
		al.setAno(ano);
		result += alertService.insertAlert(al);
		return result;
	}
	
	@RequestMapping(value= "/totalProfit.am")
	public ModelAndView totalProfit(ModelAndView model){
		ProfitInfo pi = null;
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String year = sdf.format(today);
		List <ProfitHash> plist = adminService.totalProfit(year);
		if(plist != null){
			pi = new ProfitInfo(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			for(ProfitHash ph : plist){
				System.out.println("cname : " + ph.getCname() + ", sumcost : " + ph.getSumcost() );
				switch(ph.getCname()){
				case "01" : pi.setJan(ph.getSumcost()); break;
				case "02" : pi.setFeb(ph.getSumcost()); break;
				case "03" : pi.setMar(ph.getSumcost()); break;
				case "04" : pi.setApr(ph.getSumcost()); break;
				case "05" : pi.setMay(ph.getSumcost()); break;
				case "06" : pi.setJun(ph.getSumcost()); break;
				case "07" : pi.setJul(ph.getSumcost()); break;
				case "08" : pi.setAug(ph.getSumcost()); break;
				case "09" : pi.setSep(ph.getSumcost()); break;
				case "10" : pi.setOct(ph.getSumcost()); break;
				case "11" : pi.setNov(ph.getSumcost()); break;
				case "12" : pi.setDec(ph.getSumcost()); break;
				}
			}
		}
		List <ProfitHash> cList = adminService.categoryProfit(year);
		model.addObject("pi", pi);
		model.addObject("cList", cList);
		model.setViewName("admin/totalprofit");
		return model;
	}
}

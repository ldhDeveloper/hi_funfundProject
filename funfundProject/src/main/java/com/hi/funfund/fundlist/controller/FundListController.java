package com.hi.funfund.fundlist.controller;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hi.funfund.account.model.vo.Account;
import com.hi.funfund.attachment.model.vo.Attachment;
import com.hi.funfund.fundlist.model.service.FundListService;
import com.hi.funfund.fundlist.model.vo.FundList;
import com.hi.funfund.fundlist.model.vo.Myfunding;
import com.hi.funfund.fundlist.model.vo.Mysponsor;
import com.hi.funfund.fundmenu.model.service.FundMenuService;
import com.hi.funfund.fundmenu.model.vo.FundMenu;
import com.hi.funfund.fundlist.model.vo.UpdateSponsor;
import com.hi.funfund.item.model.service.ItemService;
import com.hi.funfund.item.model.vo.Item;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.request.ScheduleData;
import com.siot.IamportRestClient.request.ScheduleEntry;
import com.siot.IamportRestClient.request.UnscheduleData;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Schedule;

import net.sf.json.JSONObject;

@Controller
// @RequestMapping("fundList")
public class FundListController {

	@Autowired
	private FundListService fundListService;
	@Autowired
	private FundMenuService fundMenuService;
	@Autowired
	private ItemService itemService;

	//내가 작성한 프로젝트 상세
	@RequestMapping(value = "myproject.fl", method = RequestMethod.GET)
	public ModelAndView selectMyProject(ModelAndView model, HttpSession session, HttpServletRequest request) {
		String pro_no = request.getParameter("pro_no");
		Item proItem = itemService.selectOne(Integer.parseInt(pro_no));
		List<Mysponsor> mlist = fundListService.selectSponsorList(Integer.parseInt(pro_no));
		model.addObject("proItem", proItem);
		model.addObject("mlist", mlist);
		model.setViewName("myproject/myprojectDetail");
		return model;
	}

	//프로젝트 새소식
	@RequestMapping(value = "myprojectnews.fl", method = RequestMethod.GET)
	public ModelAndView selectMyProjectNews(ModelAndView model, HttpSession session, HttpServletRequest request) {
		String pro_no = request.getParameter("pro_no");
		Item proItem = itemService.selectOne(Integer.parseInt(pro_no));
		model.addObject("proItem", proItem);
		model.setViewName("myproject/inputnews");
		return model;
	}

@RequestMapping(value = "exportExcel.fl", method = RequestMethod.POST)
public @ResponseBody String exportExcel(@RequestParam int pro_no, HttpServletRequest request, HttpServletResponse response) throws Exception{
	System.out.println("오니?!?");
	System.out.println("pro_no : " + pro_no);
	String filePath ="";
	List<Mysponsor> mlist = fundListService.selectSponsorList(pro_no);
	HSSFRow row;
	HSSFCell cell;
	
	HSSFWorkbook workbook = new HSSFWorkbook();
	HSSFSheet sheet = workbook.createSheet("mySheet");
	File file = null;
	row = sheet.createRow(0);
	row.createCell(0).setCellValue("후원번호");
	row.createCell(1).setCellValue("닉네임");
	row.createCell(2).setCellValue("후원명");
	row.createCell(3).setCellValue("후원금액");
	row.createCell(4).setCellValue("결제상태");
	row.createCell(5).setCellValue("배송상태");
	row.createCell(6).setCellValue("결제방법");
	row.createCell(7).setCellValue("결제근거");
	row.createCell(8).setCellValue("수량");
	row.createCell(9).setCellValue("수신자");
	row.createCell(10).setCellValue("연락처");
	row.createCell(11).setCellValue("이메일");
	row.createCell(12).setCellValue("추가금액");
	row.createCell(13).setCellValue("운송장번호");
	row.createCell(14).setCellValue("주소");

	for(int i=0; i<mlist.size(); i++){
		row = sheet.createRow(i+1);
		row.createCell(0).setCellValue(mlist.get(i).getFund_no());
		row.createCell(1).setCellValue(mlist.get(i).getNickname());
		row.createCell(2).setCellValue(mlist.get(i).getMname());
		row.createCell(3).setCellValue(mlist.get(i).getTcost());
		row.createCell(4).setCellValue(mlist.get(i).getFunstatus());
		row.createCell(5).setCellValue(mlist.get(i).getDelstatus());
		row.createCell(6).setCellValue(mlist.get(i).getPayment());
		row.createCell(7).setCellValue(mlist.get(i).getEvidence());
		row.createCell(8).setCellValue(mlist.get(i).getFundcount());
		row.createCell(9).setCellValue(mlist.get(i).getRecname());
		row.createCell(10).setCellValue(mlist.get(i).getRephone());
		row.createCell(11).setCellValue(mlist.get(i).getEmail());
		row.createCell(12).setCellValue(mlist.get(i).getAddcost());
		row.createCell(13).setCellValue(mlist.get(i).getDel_no());
		row.createCell(14).setCellValue(mlist.get(i).getDeladdress());
	}
	
	FileOutputStream outFile;
		String root = request.getSession().getServletContext().getRealPath("/");
		System.out.println("root : " + root);
		String[] roots = root.split("\\\\");
		String marger="";
		for(int i=0 ; i<roots.length-3; i++){
			marger += roots[i] + "\\";
		}
		System.out.println("marger : " + marger);
		String savePath = marger + "src/main/webapp/excel/";
		System.out.println("savepath : " + savePath);
		long currentTime = System.currentTimeMillis();  
		SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
		String rfileName = simDf.format(new Date(currentTime)) +".xls";
		filePath =savePath + rfileName;
		file = new File(filePath);
		outFile = new FileOutputStream(file);
		workbook.write(outFile);
		outFile.close();
		
		System.out.println("파일생성 완료");
	/*	if(!file.canRead()){
			throw new Exception("File can't read(파일을 찾을 수 없습니다)");
		}

	return new ModelAndView("fileDownloadView", "downloadFile", file);*/
	return "src/main/webapp/excel/" + rfileName;
}
@RequestMapping(value = "selectlist.fl", produces = "application/json")
public @ResponseBody ArrayList<FundMenu> selectfList(ModelAndView model, HttpServletRequest request, HttpServletResponse response) {
	ArrayList<FundMenu> fmlist = new ArrayList<FundMenu>();
	
	Enumeration em = request.getParameterNames();
	while(em.hasMoreElements()){
	    String parameterName = (String)em.nextElement();
	    String parameterValue = request.getParameter(parameterName);
	    String[] parameterValues = request.getParameterValues(parameterName);
	    if(parameterValues != null){
	         for(int i=0; i< parameterValues.length; i++){
	        	 FundMenu fm = new FundMenu();
	        	 fm = fundMenuService.selectOne(Integer.parseInt(parameterValues[i]));
	             System.out.println("array_" + parameterName + "=" + parameterValues[i]);
	             fmlist.add(fm);
	         }
	    }
	}
	
	System.out.println("fmlist : " + fmlist);
	
	/*model.addObject("fmlist", fmlist);
	model.setViewName("jsonView");*/
	
	return fmlist;
}



public ModelAndView selectList(ModelAndView model){
	
	List<FundList> fList = fundListService.selectList();
	
	return model;
	
}

 
	/*public ModelAndView selectList(ModelAndView model) {
		List<FundList> fList = fundListService.selectList();

		return model;

	}*/


	public String insert(FundList fList) {

		int result = fundListService.insert(fList);

		return null;
	}

	public String update(FundList fList) {

		int result = fundListService.update(fList);
		return null;
	}
	
	// myfundingDetail.fl 상세 페이지 select

	@RequestMapping(value = "myfundingDetail.fl")
	public ModelAndView myfundingDetail(ModelAndView model, HttpSession session, HttpServletRequest request) {		
		int fund_no = Integer.parseInt(request.getParameter("fund_no"));
		
		Myfunding myfunding = fundListService.selectMyfundingDetail(fund_no);
		
		model.addObject("myfunding", myfunding);
		model.setViewName("myinfo/myfundingDetail");
		
		return model;
	}
	
	// myfundingDetail.fl 상세 페이지 select
	
	@RequestMapping(value = "myfundingSponDetail.fl")
	public ModelAndView myfundingSponDetail(ModelAndView model, HttpSession session, HttpServletRequest request) {		
		int fund_no = Integer.parseInt(request.getParameter("fund_no"));		
		
		Myfunding myfundingSpon = fundListService.selectMyfundingSponDetail(fund_no);
		
		model.addObject("myfundingSpon", myfundingSpon);
		model.setViewName("myinfo/myfundingSponDetail");
		
		return model;
	}
	
	// joinCancle.fl 참여 취소
	
	@RequestMapping(value = "joinCancle.fl", method = RequestMethod.POST)
	public String joinCancle(RedirectAttributes ra, HttpSession session, HttpServletRequest request) {		
		int fund_no = Integer.parseInt(request.getParameter("fund_no"));
		
		int result = fundListService.cancleMyfundingDetail(fund_no);
		
		ra.addAttribute("fund_no", fund_no);
		
		return "redirect:myfunding.ao";
	}
	
	// deliveryChange.fl 배송지 정보 변경
	
	@RequestMapping(value = "deliveryChange.fl", method = RequestMethod.POST)
	public String deliveryChange(RedirectAttributes ra, HttpSession session, HttpServletRequest request) {
		System.out.println("오니?");
		
		int fund_no = Integer.parseInt(request.getParameter("fund_no"));
		String recname = request.getParameter("recname");
		String rephone = request.getParameter("rephone");
		String deladdress1 = request.getParameter("deladdress1");
		String deladdress2 = request.getParameter("deladdress2");
		String deladdress3 = request.getParameter("deladdress3");
		String deladdress = deladdress1 + "@" + deladdress2 + "@" + deladdress3;
		
		System.out.println("deliveryChange controller 1 fund_no : " + fund_no + " recname : " + recname + " rephone : " + rephone + " deladdress : " + deladdress);
		
		int result = fundListService.updateDelivery(fund_no, recname, rephone, deladdress);
		
		System.out.println("deliveryChange controller 2 fund_no : " + fund_no + " recname : " + recname + " rephone : " + rephone + " deladdress : " + deladdress);
		
		ra.addAttribute("fund_no", fund_no);
		
		return "redirect:myfundingDetail.fl";
	}
	
	// changeOption 옵션 변경
	@RequestMapping(value = "changeOption.fl")
	public String changeOption(RedirectAttributes ra, HttpSession session, HttpServletRequest request) {		
		int fund_no = Integer.parseInt(request.getParameter("fund_no"));
		int fundcount = Integer.parseInt(request.getParameter("fundcount"));
		
		int result = fundListService.updateOption(fund_no, fundcount);
		
		ra.addAttribute("fund_no", fund_no);
		
		return "redirect:myfundingDetail.fl";
	}
	
	
	
	@RequestMapping("gopayment.fl")
	public @ResponseBody int sendPayInfo(HttpSession session, HttpServletRequest request, @RequestParam(value="orderlist[]") List<Integer> orderlist
			, @RequestParam(value="ordercount[]") List<Integer> ordercount, @RequestParam String rename, @RequestParam String rephone,
			@RequestParam String address, @RequestParam String cardnum){
		ArrayList<HashMap<String, String>> alist = new ArrayList<HashMap<String, String>>();
		session = request.getSession(false);
		Account account = (Account) session.getAttribute("account");
		int ano = account.getAno();
		for(int i = 0; i < orderlist.size(); i++){
			HashMap<String, String> hmap = new HashMap<String, String>();
			hmap.put("mno", Integer.toString(orderlist.get(i)));
			hmap.put("fundcount", Integer.toString(ordercount.get(i)));
			hmap.put("recname", rename);
			hmap.put("rephone", rephone);
			hmap.put("deladdress", address);
			hmap.put("evidence", cardnum);
			hmap.put("ano", Integer.toString(ano));
			alist.add(hmap);
		}
		int result = fundListService.insertFundingList(alist);
		
		return result;
	}
	
	@RequestMapping("payment.fl")
	public ModelAndView payment(ModelAndView model){
		
		//인증요청
		String test_api_key = "9856064046040656";
		String test_api_secret = "GMMpCiJ9gK1p7TzdFSJ1ZnQmktP7ZjrG6d6IwPSMzTcHNLUsEEuE1k1lNQtNaUuh8AZEqSr0LDHzpC14";
		IamportClient client = new IamportClient(test_api_key, test_api_secret);
		
		//토큰발급
		IamportResponse<AccessToken> auth_response = client.getAuth();
		assertNotNull(auth_response.getResponse());
		assertNotNull(auth_response.getResponse().getToken());
		
		//예약결제
		String test_customer_uid = "customer_123456";
		ScheduleData schedule_data = new ScheduleData(test_customer_uid);
		
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, 2018);
		cal.set(Calendar.MONTH, Calendar.OCTOBER);
		cal.set(Calendar.DAY_OF_MONTH, 25);
		java.util.Date d1 = cal.getTime();
		
		cal.set(Calendar.YEAR, 2018);
		cal.set(Calendar.MONTH, Calendar.NOVEMBER);
		cal.set(Calendar.DAY_OF_MONTH, 25);
		java.util.Date d2 = cal.getTime();
		
		cal.set(Calendar.YEAR, 2018);
		cal.set(Calendar.MONTH, Calendar.DECEMBER);
		cal.set(Calendar.DAY_OF_MONTH, 25);
		java.util.Date d3 = cal.getTime();
	
		schedule_data.addSchedule(new ScheduleEntry(getRandomMerchantUid(), d1, BigDecimal.valueOf(1004)));
		schedule_data.addSchedule(new ScheduleEntry(getRandomMerchantUid(), d2, BigDecimal.valueOf(1005)));
		schedule_data.addSchedule(new ScheduleEntry(getRandomMerchantUid(), d3, BigDecimal.valueOf(1006)));
		
		System.out.println("예약 요청");
		IamportResponse<List<Schedule>> schedule_response = client.subscribeSchedule(schedule_data);
		
		List<Schedule> schedules = schedule_response.getResponse();
		List<ScheduleEntry> req_schedules = schedule_data.getSchedules();
		
		/*for (int i = 0; i < 3; i++) {
			System.out.println("오니?");
			assertEquals(schedules.get(i).getCustomerUid(), test_customer_uid);
			assertEquals(schedules.get(i).getMerchantUid(), req_schedules.get(i).getMerchantUid());
			assertDateEquals(schedules.get(i).getScheduleAt(), req_schedules.get(i).getScheduleAt());
			assertEquals(schedules.get(i).getAmount(), req_schedules.get(i).getAmount());
		}*/
		
		try {
			//1초 후 등록된 예약 unschedule by multiple merchant_uid
			Thread.sleep(1000);
			System.out.println("복수 merchant_uid 예약 취소 요청");
			UnscheduleData unschedule_data = new UnscheduleData(test_customer_uid);
			unschedule_data.addMerchantUid( req_schedules.get(0).getMerchantUid() );
			unschedule_data.addMerchantUid( req_schedules.get(2).getMerchantUid() );
			
			IamportResponse<List<Schedule>> unschedule_response = client.unsubscribeSchedule(unschedule_data);
			List<Schedule> cancelled_schedule = unschedule_response.getResponse();
			
			assertNotNull(cancelled_schedule);
			assertEquals(cancelled_schedule.get(0).getMerchantUid(), req_schedules.get(0).getMerchantUid());
			assertEquals(cancelled_schedule.get(1).getMerchantUid(), req_schedules.get(2).getMerchantUid());
			
			//1초 후 등록된 예약 unschedule by single multiple_uid
			Thread.sleep(1000);
			System.out.println("단일 merchant_uid 예약 취소 요청");
			unschedule_data = new UnscheduleData(test_customer_uid);
			unschedule_data.addMerchantUid( req_schedules.get(1).getMerchantUid());
			
			unschedule_response = client.unsubscribeSchedule(unschedule_data);
			cancelled_schedule = unschedule_response.getResponse();
			
			assertNotNull(cancelled_schedule);
			assertEquals(cancelled_schedule.get(0).getMerchantUid(), req_schedules.get(1).getMerchantUid());
			
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		
		return model;
	}
	

	private String getRandomMerchantUid() {
		DateFormat df = new SimpleDateFormat("$$hhmmssSS");
		int n = (int) (Math.random() * 100) + 1;
		
		return df.format(new Date(new GregorianCalendar().getTimeInMillis())) + "_" + n;
  }
	
	@RequestMapping(value = "fileDown.fl")
	public ModelAndView fileDownLoad(ModelAndView model, HttpServletRequest request) {
		System.out.println("파일오니?");
		
		String f = request.getParameter("downloadFile");
		System.out.println("f나와 : " + f);
		File file = new File(f);
		model.addObject("downloadFile", file);
		model.setViewName("fileDownloadView");
		return model;
	}
	
	@RequestMapping(value = "importExcel.fl", method=RequestMethod.POST)
	public @ResponseBody List<Mysponsor> importExcelLoad(Mysponsor mysponsor, HttpServletRequest request) throws  IOException{
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		MultipartFile fileObj = multipartRequest.getFile("fileObj");
		
		List<Mysponsor> mlist = new ArrayList<Mysponsor>();
		HttpSession session = request.getSession(false);
		//FileInputStream fis = null;
		HSSFWorkbook workbook = null;
		
		try {
			workbook = new HSSFWorkbook(fileObj.getInputStream());
			HSSFSheet sheet;
			HSSFRow row;
			HSSFCell cell;
			Mysponsor vo;
			String value;
			sheet = workbook.getSheetAt(0);
			for(int i=1; i < sheet.getPhysicalNumberOfRows(); i++){
				//if(i != 0){
					row = sheet.getRow(i);
					vo = new Mysponsor();
					//if(row.getCell(0).getNumericCellValue()){
						for(int j=0; j <= row.getPhysicalNumberOfCells(); j++){
							cell = row.getCell(j);
							value = "";
							if(cell != null){
								switch(cell.getCellTypeEnum()){
								case BLANK : 
									value = "";
									break;
								case FORMULA :
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC : 
									value = (int)cell.getNumericCellValue() + "";
									break;
								case STRING :
									value = cell.getStringCellValue() + "";
									break;
								case ERROR :
									value = cell.getErrorCellValue() + "";
									break;
								default :
									value = new String();
									break;
								}
							}
							System.out.println(value);
							switch(j){
							case 0 : vo.setFund_no(Integer.parseInt(value)); break;
							case 1 : vo.setNickname(value); break;
							case 2 : vo.setMname(value); break;
							case 3 : vo.setTcost(Integer.parseInt(value)); break;
							case 4 : vo.setFunstatus(value); break;
							case 5 : vo.setDelstatus(value); break;
							case 6 : vo.setPayment(value); break;
							case 7 : vo.setEvidence(value); break;
							case 8 : vo.setFundcount(Integer.parseInt(value)); break;
							case 9 : vo.setRecname(value); break;
							case 10 : vo.setRephone(value); break;
							case 11 : vo.setEmail(value); break;
							case 12 : vo.setAddcost(Integer.parseInt(value)); break;
							case 13 : vo.setDel_no(value); break;
							case 14 : vo.setDeladdress(value); break;
							}
							System.out.println(vo);
						}
						mlist.add(vo);
					//}
				//}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("mlist : " + mlist);
		return mlist;
	}
	
	@RequestMapping(value = "changeSupporterList.fl", method =RequestMethod.POST)
	public String changeSupporterList(RedirectAttributes ra, UpdateSponsor updatesponsor, ModelAndView model, HttpServletRequest request) {
		System.out.println(updatesponsor);
		int result = fundListService.changeSupporterList(updatesponsor);
		System.out.println("수정한 컬럼수 : " + result);
		ra.addAttribute("pro_no", updatesponsor.getPro_no());
		return "redirect:myproject.fl";
	}
}

package com.hi.funfund.account.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.AuthMail.AuthMail;
import com.hi.funfund.account.model.service.AccountService;
import com.hi.funfund.account.model.vo.Account;
import com.hi.funfund.account.model.vo.Party;
import com.hi.funfund.attachment.model.service.AttachmentService;
import com.hi.funfund.attachment.model.vo.Attachment;
import com.hi.funfund.item.model.service.ItemService;
import com.hi.funfund.item.model.vo.Item;



@Controller
//@RequestMapping("account")
public class AccountController {

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private AttachmentService attachmentService;

  @Autowired
	private ItemService itemService;
	
	@RequestMapping("/login.ao")
	public ModelAndView login(Party party, Account account, ModelAndView mv, HttpServletRequest request){
		account = accountService.login(account);
		Party p = accountService.loginParty(account.getAno());
		HttpSession session = request.getSession(false);
		if(account != null){
			session.setAttribute("account", account);
			session.setAttribute("party", p);
		}
		mv.setViewName("home");
		return mv;
	}
	
	@RequestMapping(value = "/loginWithApi.ao") // 타 사이트 정보로 회원가입
	public ModelAndView loginWithThirdParty(Account account, ModelAndView mv, HttpServletRequest request ){
		String access_token = request.getParameter("access_token");
		System.out.println(account);
		Account thirdPartyUser = accountService.selectThirdPartyUser(account);
		Party p = null;
			HttpSession session = request.getSession(false);
			if(thirdPartyUser != null){
				
				p = accountService.loginParty(thirdPartyUser.getAno());
				session.setAttribute("account", thirdPartyUser);
				session.setAttribute("party", p);	
				mv.setViewName("redirect:/");
				session.setAttribute("access_token", access_token);
			}else{
				mv.addObject("loginFail", "로그인에 실패 했습니다.");
				mv.setViewName("home");
			}				System.out.println(mv);
			
		
		return mv;
	}
	
	
	
	@RequestMapping(value = "/signup.ao", produces = "text/plain;charset=UTF-8")
	public String signup(Account account){
		int ok = accountService.insert(account);
		String result="";
		if(ok > 0){
			result = "home";
		}
		return result;
	}
	
	@RequestMapping("/logout.ao")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
	// myinfo 회원정보 설정 시작
	
	@RequestMapping(value = "myinfo.ao")
	public String myinfo(){
		return "myinfo/myinfo";
	}
	
	@RequestMapping(value = "myinfo1.ao")
	public String myinfo1(){
		
		return "myinfo/myinfo";
	}
	
	@RequestMapping(value = "investRequest.ao")
	public String investRequest(){
		return "myinfo/investRequest";
	}
	
	@RequestMapping(value = "sellerinfo.ao")
	public String sellerinfo(){
		return "myinfo/sellerinfo";
	}
	
	@RequestMapping(value = "joinproject.ao")
	public String joinproject(){
		return "myinfo/joinproject";
	}
	
	@RequestMapping(value = "puttoproject.ao")
	public ModelAndView puttoproject(ModelAndView model, HttpSession session, HttpServletRequest request){
		session = request.getSession(false);
		Account account = (Account)session.getAttribute("account");
		int ano = account.getAno();
		List<Item> iList = itemService.selectMyItems(ano);
		model.addObject("iList", iList);
		model.setViewName("myinfo/puttoproject");
		System.out.println("마이프로젝트 리스트 : " + iList);
		return model;
	}
	
	@RequestMapping(value = "newproject.ao")
	public String newproject(){
		return "myinfo/newproject";
	}
	
	@RequestMapping(value = "myfunding.ao")
	public String myfunding(){
		return "myinfo/myfunding";
	}
	
	
	// Myinfo 이름, 닉네임 변경 시각
	
	@RequestMapping(value = "changeMyinfo.ao")
	public String changeMyinfo(ModelAndView model, HttpSession session, HttpServletRequest request) {		
		session = request.getSession(false);
		Account account = (Account)session.getAttribute("account");
		
		int ano = account.getAno();
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		
		//이름
		
		Party party = accountService.loginParty(ano);
				
		if(party == null){
			int result = accountService.insertName(ano, name);
		}
		
		else {
			int result2 = accountService.updateName(ano, name);
		}
		party = accountService.loginParty(ano);
		session.setAttribute("party", party);
		
		// 닉네임		
		if(account != null) {
			int result = accountService.updateNickname(ano, nickname);
		}
		
		account = accountService.selectAccount(ano);
		session.setAttribute("account", account);
		
		return "myinfo/myinfo";
	}
	
	// myinfo 비밀번호 변경 시작
	
	@RequestMapping(value = "changePwd.ao")
	public ModelAndView changePwd(ModelAndView model, HttpSession session, HttpServletRequest request) {
		System.out.println("오니?");
		session = request.getSession(false);
		Account account = (Account)session.getAttribute("account");
		
		int ano = account.getAno();
		String oldPwd = request.getParameter("oldPwd");
		String newPwd = request.getParameter("newPwd");		
		
		Account account2 = accountService.selectOldPwd(ano, oldPwd);
		
		System.out.println("PWD Controller ano : " + ano + " oldPwd : " + oldPwd);
		
		if(account2 != null) {
			int result = accountService.updatePwd(ano, newPwd);
			
			System.out.println("PWD Controller2 ano : " + ano + " newPwd : " + newPwd);
		}
		
		model.addObject("account", account2);
		model.setViewName("myinfo/myinfo");	
		
		return model;
	}		
	// myinfo 비밀번호 변경 끝
	
	
	// myinfo 이메일 인증 시작
	
	@RequestMapping(value = "authEmail.ao", method=RequestMethod.GET)
	public @ResponseBody void authEmail(@RequestParam("email") String email, @RequestParam("authNumber") String authNumber) {
		ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Mail.xml");
		
	    AuthMail mm = (AuthMail) context.getBean("mailMail");
	    mm.sendMail("from@no-spam.com", email, "Funfund에서 이메일 인증번호를 발송합니다.", "인증번호는 <strong>" + authNumber + "</strong>입니다.");
	    
	    return;
	}
	
	@RequestMapping(value = "authNumerCheck.ao", method=RequestMethod.GET)
	public @ResponseBody void authNumerCheck(@RequestParam("email") String email, @RequestParam("ano") String ano) {
		int result = accountService.updateEmail(ano, email);
		
	    return;
	}
	
	// seller 정보 변경 시작
	
	@RequestMapping(value = "changSeller.ao")
	public String changSeller(Attachment vo, HttpServletRequest request) throws  IOException{
		System.out.println("오니?");
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile idimage = multipartRequest.getFile("idimage");
		HttpSession session = request.getSession(false);
		String page="";
		
		String photoflag = request.getParameter("photoflag");
		System.out.println("photoflag = " + photoflag);
		
		String root = request.getSession().getServletContext().getRealPath("/");
		/*System.out.println("root : " + root);*/
		String[] roots = root.split("\\\\");
		String merger="";
		for(int i=0 ; i<roots.length-3; i++){
			merger += roots[i] + "\\";
		}
		/*System.out.println("merger : " + merger);*/
		String savePath = merger + "src/main/webapp/images/myinfo/sellerinfo/";
		/*System.out.println("savepath : " + savePath);*/
		
		Account account = (Account)session.getAttribute("account");
		
		int ano = account.getAno();
		int result = 0;
		
		Party party = accountService.loginParty(ano);
		
		System.out.println("seller Controller ano : " + ano);
		
		String phone = request.getParameter("phone");
		
		String id_no1 = request.getParameter("id_no1");
		String id_no2 = request.getParameter("id_no2");
		
		String id_no = id_no1 + "-" + id_no2;
				
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address3 = request.getParameter("address3");
		
		String address = address1 + "@" + address2 + "@" + address3;
		
		String rfileName = null;
		
		System.out.println("seller Controller ano : " + ano + " phone : " + phone + " id_no : " + id_no + " address : " + address);
		
		result = accountService.updateSeller(ano, phone, id_no, address);
		
		System.out.println("seller Controller ano : " + ano + " phone : " + phone + " id_no : " + id_no + " address : " + address);

		if(result > 0){			
			//오리지널 파일 이름 생성
			String ofileName = idimage.getOriginalFilename();
			//시간데이터 생성하여 오리지널 파일의 확장자 명을 더해서 새파일명 생성
			long currentTime = System.currentTimeMillis();  
		    SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
			rfileName = simDf.format(new Date(currentTime)) +"."
					+ ofileName.substring(ofileName.lastIndexOf(".")+1);;
					idimage.transferTo(new File(savePath + rfileName));
			//account의 ano 추출
			party = (Party)session.getAttribute("party");
			int pno = party.getPno();
			//attachment 테이블에 insert/update 할 vo객체 생성
			
			vo.setOrifname(ofileName);
			vo.setRefname(rfileName);
			vo.setFtype("party");
			vo.setFsubtype("idimage");
			vo.setRefno(pno);
			
			//전달받은 photoflag 값이 insert 일경우 attachment 테이블에 사진파일 insert 실행
			if(photoflag.equals("insert")){
				result = attachmentService.insertIdImage(vo);
				System.out.println("Controller insertIdImage : " + vo);
				System.out.println("insert 발생");
			}
			
			//전달받은 photoflag 값이 update 일경우 attachment 테이블에 사진파일 update 실행
			if(photoflag.equals("update")){
				result = attachmentService.updateIdImage(vo);
				System.out.println("Controller updateIdImage : " + vo);
				System.out.println("update 발생");
			}
			
			//insert or update 가 성공할 경우 해당 사진의 계정 테이블(account)에 pimage 컬럼 update
			if(result > 0){
				HashMap<String, String> hmap = new HashMap<String, String>();
				hmap.put("ano", Integer.toString(ano));
				hmap.put("idimage", rfileName);
				result = attachmentService.partyIdImage(hmap);
				
				System.out.println("seller idimage Controller ano : " + ano + " rfileName : " + rfileName);
				
				//페이지에 나타나는 사진이미지를 갱신해주기위해 account 객체를 조회하여 세션의 account에 덮어씀
				if(result > 0){
					Party p = accountService.loginParty(ano);
					session = request.getSession(false);
					session.setAttribute("party", p);	
				} else {
					System.out.println("업로드 실패");
				}				
			}
		}
		
		party = accountService.selectResult(ano);
		
		System.out.println("seller Controller3 ano : " + ano + " party : " + party);
		
		session.setAttribute("party", party);
		
		return "myinfo/sellerinfo";
	}	
}

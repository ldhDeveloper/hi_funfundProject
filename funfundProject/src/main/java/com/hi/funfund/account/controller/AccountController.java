package com.hi.funfund.account.controller;

import java.io.IOException;

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
import com.hi.funfund.account.model.vo.Party;

@Controller
//@RequestMapping("account")
public class AccountController {

	@Autowired
	private AccountService accountService;
	
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
		return "home";
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
	public String puttoproject(){
		return "myinfo/puttoproject";
	}
	
	@RequestMapping(value = "newproject.ao")
	public String newproject(){
		return "myinfo/newproject";
	}
	
	@RequestMapping(value = "myfunding.ao")
	public String myfunding(){
		return "myinfo/myfunding";
	}
	
	// myinfo 회원 정보 설정 끝
	
	
	// myinfo 비밀번호 변경 시작
	
	@RequestMapping(value = "changePwd.ao")
	public ModelAndView insertRewardItem(ModelAndView model, HttpSession session, HttpServletRequest request) {
		System.out.println("오니?");
		/*int ano = Integer.parseInt(request.getParameter("ano"));*/
		session = request.getSession(false);
		Account account = (Account)session.getAttribute("account");
		int ano = account.getAno();
		String oldPwd = request.getParameter("oldPwd");
		String newPwd = request.getParameter("newPwd");
		
		System.out.println("ano : " + ano + " oldPwd : " + oldPwd + " newPwd : " + newPwd);
		
		account = accountService.selectOldPwd(ano, oldPwd);
		
		System.out.println("Controller ano : " + ano + " oldPwd : " + oldPwd);
		
		int result = accountService.updatePwd(ano, newPwd);
		
		System.out.println("Controller ano : " + ano + " newPwd : " + newPwd);
		
		model.addObject("account", account);
		model.setViewName("myinfo/myinfo");		
		return model;
	}
		
	// myinfo 비밀번호 변경 끝
}

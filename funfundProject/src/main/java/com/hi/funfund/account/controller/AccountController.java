package com.hi.funfund.account.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hi.funfund.account.model.service.AccountService;
import com.hi.funfund.account.model.vo.Account;

@Controller
//@RequestMapping("account")
public class AccountController {

	@Autowired
	private AccountService accountService;
	
	@RequestMapping("/login.ao")
	public ModelAndView login(Account account, ModelAndView mv, HttpServletRequest request){
		account = accountService.login(account);
		HttpSession session = request.getSession(false);
		if(account != null){
			session.setAttribute("account", account);
		}
		mv.setViewName("home");
		return mv;
	}
	
	@RequestMapping("/sinup.ao")
	public String signup(Account account){
		int ok = accountService.insert(account);
		if(ok > 0){
			
		}
		return "home";
	}
	
	@RequestMapping("/logout.ao")
	public String logout(HttpSession session){
		session.invalidate();
		return "home";
	}
	
	
}

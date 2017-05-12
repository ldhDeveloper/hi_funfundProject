package com.hi.funfund;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "start.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "make.do")
	public String make(){
		return "makeproject/choiceitem";
	}

	// myinfo 회원정보 설정 시작	
	@RequestMapping(value = "myinfo.do")
	public String myinfo(){
		return "myinfo/myinfo";
	}
	
	@RequestMapping(value = "sellerinfo.do")
	public String sellerinfo(){
		return "myinfo/sellerinfo";
	}
	
	@RequestMapping(value = "joinproject.do")
	public String joinproject(){
		return "myinfo/joinproject";
	}
	
	@RequestMapping(value = "puttoproject.do")
	public String puttoproject(){
		return "myinfo/puttoproject";
	}
	
	@RequestMapping(value = "newproject.do")
	public String newproject(){
		return "myinfo/newproject";
	}
	
	@RequestMapping(value = "myfunding.do")
	public String myfunding(){
		return "myinfo/myfunding";
	}
	
	@RequestMapping(value = "investRequest.do")
	public String investRequest(){
		return "myinfo/investRequest";
	}
	
	// myinfo 회원 정보 설정 끝
	
	@RequestMapping(value = "makeproject.do")
	public String makeProject(){
		return "makeproject/primaryinfo";
	}
	
	
	
}

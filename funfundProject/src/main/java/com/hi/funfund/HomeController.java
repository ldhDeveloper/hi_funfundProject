package com.hi.funfund;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	

	@RequestMapping(value = "funding.do")
	public String funding(){
		return "funding/funding";
	}
	
	@RequestMapping(value = "makeproject.do")
	public String makeProject(){
		return "makeproject/primaryinfo";
	}
	
	@RequestMapping(value="detail.do")
	public String fundingdetailList(){
		return "funding/detailList";
	}
	
	/*// Ajax 추가
	@RequestMapping(value = "/json/jsonList.do")
	public ModelAndView outputJsonList(ModelAndView modelAndView) {
	    SomeDTO someData = someService.someMethod();
	     
	    Map map = new HashMap();
	    map.put("someData", someData);
	    map.put("strData", "strData");
	     
	    modelAndView.addAllObjects(map);
	 
	    // Keypoint ! setViewName에 들어갈 String 파라미터는 JsonView bean 설정해줬던 id와 같아야 한다.
	    modelAndView.setViewName("jsonView");
	     
	    return modelAndView;
	}*/
	
}

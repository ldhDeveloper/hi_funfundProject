package com.hi.funfund.account.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
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
	
	@RequestMapping(value = "/loginWithApi.ao") // 타 사이트 정보로 회원가입
	public ModelAndView loginWithThirdParty(Account account, ModelAndView mv, HttpServletRequest request ){
		String access_token = request.getParameter("access_token");
		System.out.println(account);
		Account thirdPartyUser = accountService.selectThirdPartyUser(account);
		Party p = null;
			HttpSession session = request.getSession(false);
			if(thirdPartyUser != null){
				thirdPartyUser.setIdtoken(access_token);
				p = accountService.loginParty(thirdPartyUser.getAno());
				session.setAttribute("account", thirdPartyUser);
				session.setAttribute("party", p);			
			}else{
				mv.addObject("loginFail", "로그인에 실패 했습니다.");
			}				
			mv.setViewName("redirect:/");
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
	
	
	// Myinfo 이름, 닉네임 변경 시각
	
	@RequestMapping(value = "changeMyinfo.ao")
	public String changeMyinfo(ModelAndView model, HttpSession session, HttpServletRequest request) {
		System.out.println("오니?");
		
		session = request.getSession(false);
		Account account = (Account)session.getAttribute("account");
		
		int ano = account.getAno();
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		
		//이름
		
		Party party = accountService.loginParty(ano);
				
		if(party == null){
			int result = accountService.insertName(ano, name);
			
			System.out.println("Controller ano : " + ano + " name : " + name);
		}
		
		else {
			int result2 = accountService.updateName(ano, name);
			
			System.out.println("Controller2 ano : " + ano + " name : " + name);
		}
		party = accountService.loginParty(ano);
		session.setAttribute("party", party);
		
		// 닉네임
		
		System.out.println("Controller3 account" + account);
		
				
		if(account != null) {
			int result = accountService.updateNickname(ano, nickname);
			System.out.println("Controller4 account" + account);
			System.out.println("Controller5 nickname : " + nickname);
		}
		
		/*account.setNickname(nickname);*/
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
		
		System.out.println("ano : " + ano + " oldPwd : " + oldPwd + " newPwd : " + newPwd);
		
		Account account2 = accountService.selectOldPwd(ano, oldPwd);
		
		System.out.println("Controller ano : " + ano + " oldPwd : " + oldPwd + " account2 : " + account2);
		
		if(account2 != null) {
			int result = accountService.updatePwd(ano, newPwd);
			
			System.out.println("Controller ano : " + ano + " newPwd : " + newPwd);										
		}
		
		model.addObject("account", account2);
		model.setViewName("myinfo/myinfo");	
		
		return model;
	}		
	// myinfo 비밀번호 변경 끝
	
	
	// myinfo 이메일 인증 시작
	
	/*@RequestMapping(value = "certifyEmail.ao")
	public String certifyEmail(ModelAndView model, HttpSession session, HttpServletRequest request) {
	   
	         
	        // 메일 관련 정보
	        String host = "smtp.naver.com";
	        final String username = "XXXXXXX";       //네이버 이메일 주소중 @ naver.com앞주소만 기재합니다.
	        final String password = "1234";   //네이버 이메일 비밀번호를 기재합니다.
	        int port=465;
	         
	        // 메일 내용
	        String recipient = "XXXXXXX@nate.com";    //메일을 발송할 이메일 주소를 기재해 줍니다.
	        String subject = "네이버를 사용한 발송 테스트입니다.";
	        String body = "내용 무";
	         
	        Properties props = System.getProperties();
	          
	          
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.port", port);
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.ssl.enable", "true");
	        props.put("mail.smtp.ssl.trust", host);
	           
	        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	            String un=username;
	            String pw=password;
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(un, pw);
	            }
	        });
	        session.setDebug(true); //for debug
	           
	        Message mimeMessage = new MimeMessage(session);
	        mimeMessage.setFrom(new InternetAddress("mong400@naver.com"));
	        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
	        mimeMessage.setSubject(subject);
	        mimeMessage.setText(body);
	        Transport.send(mimeMessage);	 
	    }
	
		return "logout.ao";
	}*/
	
	/*@Component
	public class HelpMailSender implements HelpMailSendable{
	 
		@Resource(name = "mailSender")
		JavaMailSender mailSender;
	 
		public void sendEmail(String email, String pw) {
	 
			MimeMessage message = mailSender.createMimeMessage();
			try {
				message.setSubject("[안내] 임시 비밀번호 발신 <관리자가 보낸메일>", "euc-kr");
				String htmlContent = "당신의 임시 비밀번호는 <Strong>" + pw
						+ "</Strong> 입니다. 사이트에 접속해서 로그인 후 비밀번호를 변경하세요.<br>";
				htmlContent += "<a href='http://localhost:9999/index.choon' target='_blank'>홈으로 이동</a>";
				message.setText(htmlContent, "euc-kr", "html");
				message.setFrom(new InternetAddress(""));
				message.addRecipient(RecipientType.TO, new InternetAddress(email));
				mailSender.send(message);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
	 
		}
	 
	}*/
	
	/*@RequestMapping(value = "certifyEmail.ao")
	public String certifyEmail(ModelAndView model, HttpSession session, HttpServletRequest request) {
		System.out.println("오니?");
		
		String email = request.getParameter("email");
		
		Properties p = System.getProperties();
        p.put("mail.smtp.starttls.enable", "true");     // gmail은 무조건 true 고정
        p.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 주소
        p.put("mail.smtp.auth","true");                 // gmail은 무조건 true 고정
        p.put("mail.smtp.port", "587");                 // gmail 포트
           
        Authenticator auth = new MyAuthentication();
         
        //session 생성 및  MimeMessage생성
        session = session.getDefaultInstance(p, auth);
        MimeMessage msg = new MimeMessage(session);
         
        try{
            //편지보낸시간
            msg.setSentDate(new Date());
             
            InternetAddress from = new InternetAddress() ;
             
             
            from = new InternetAddress("ldh8206<ldh8206@gmail.com>");
             
            // 이메일 발신자
            msg.setFrom(from);
             
             
            // 이메일 수신자
            InternetAddress to = new InternetAddress(email);
            msg.setRecipient(Message.RecipientType.TO, to);
             
            // 이메일 제목
            msg.setSubject("[안내] 임시 비밀번호 발신 <관리자가 보낸메일>", "UTF-8");
             
            
            char[] charaters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'};
            StringBuffer sb = new StringBuffer();
            Random rn = new Random();
            for( int i = 0 ; i < 10 ; i++ ){
                sb.append( charaters[ rn.nextInt( charaters.length ) ] );
            }
            String pw =  sb.toString();
       
            
            String htmlContent = "당신의 임시 비밀번호는 <Strong>" + pw + "</Strong> 입니다. 사이트에 접속해서 로그인 후 비밀번호를 변경하세요.<br>"; 
            htmlContent += "<a href='http://localhost:7660/jsmi/views/main1/member/resetpwdform.jsp?userid=" + userid + "&target='_blank'>홈으로 이동</a>"; 
            msg.setText(htmlContent, "UTF-8", "html"); 

            
            // 이메일 내용
 
             
            // 이메일 헤더
            msg.setHeader("content-Type", "text/html");
            
            int result = new PartyService().updatePwd(userid, pw);
    		
    		RequestDispatcher view = null;
    		if(result > 0){
    			javax.mail.Transport.send(msg);
    			view = request.getRequestDispatcher("views/main1/member/successsendmail.html");
    			request.setAttribute("message", "이메일로 임시비밀번호가 발송되었습니다.");
    			view.forward(request, response);
    		}else{
    			view = request.getRequestDispatcher("views/main1/member/memberError.jsp");
    			request.setAttribute("message", "임시비밀번호 발송에 실패하였습니다.");
    			view.forward(request, response);
    		}
            //메일보내기
            
             
        }
		
		return "myinfo/myinfo";
	}*/
	
	// myinfo 이메일 인증 끝
}

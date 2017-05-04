package com.hi.funfund.account.model.service;

import com.hi.funfund.account.model.vo.Account;

public interface AccountService {

	public int join();
	
	public Account login();
	
	public String findId(Account account);
	
	public int findPwd(Account account);
	
	public Account checkId(Account account);
	
	public int update(Account account);
	

}

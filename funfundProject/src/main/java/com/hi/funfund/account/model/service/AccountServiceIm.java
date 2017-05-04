package com.hi.funfund.account.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.funfund.account.model.dao.AccountDao;
import com.hi.funfund.account.model.vo.Account;

@Service("AccountService")
public class AccountServiceIm implements AccountService {

	@Autowired
	AccountDao accountDao;

	@Override
	public int join() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Account login() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String findId(Account account) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int findPwd(Account account) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Account checkId(Account account) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Account account) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}

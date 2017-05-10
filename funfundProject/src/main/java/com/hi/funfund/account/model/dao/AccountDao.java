package com.hi.funfund.account.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hi.funfund.account.model.vo.Account;

@Repository("accountDao")
public class AccountDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Account login(Account account) {
		account = (Account)sqlSession.selectOne("login", account);
		return account;
	}

}

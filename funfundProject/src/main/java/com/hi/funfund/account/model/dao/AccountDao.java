package com.hi.funfund.account.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hi.funfund.account.model.vo.Account;
import com.hi.funfund.account.model.vo.Party;

@Repository("accountDao")
public class AccountDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Account login(Account account) {
		account = (Account)sqlSession.selectOne("login", account);
		return account;
	}

	public int insert(Account account) {
		int result = sqlSession.insert("signupAccount", account);
		/*if(result > 0){
			sqlSession.commit();
		}*/
		return result;
	}

	public Party loginParty(int ano) {
		Party p  = (Party)sqlSession.selectOne("loginParty", ano);
		return p;
	}

	public Account selectOldPwd(int ano, String oldPwd) {
		Account account = (Account) sqlSession.selectOne("selectOldPwd", ano);
		return account;
	}

	public int updatePwd(int ano, String newPwd) {
		int result = sqlSession.insert("updatePwd", ano);
		return result;
	}
}

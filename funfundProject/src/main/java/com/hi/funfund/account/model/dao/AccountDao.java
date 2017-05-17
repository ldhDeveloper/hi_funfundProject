package com.hi.funfund.account.model.dao;

import java.util.*;

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
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("ano", Integer.toString(ano));
		hmap.put("oldPwd", oldPwd);
		Account account = (Account) sqlSession.selectOne("selectOldPwd", hmap);
		System.out.println("Dao ano : " + ano + " oldPwd : " + oldPwd + " account : " + account);
		return account;
	}

	public int updatePwd(int ano, String newPwd) {
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("ano",  Integer.toString(ano));
		hmap.put("newPwd", newPwd);
		int result = sqlSession.update("updatePwd", hmap);
		System.out.println("Dao ano : " + ano + " newPwd : " + newPwd + " result : " + result);
		return result;
	}

	public int insertName(int ano, String name) {
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("ano",  Integer.toString(ano));
		hmap.put("name", name);
		int result = sqlSession.update("insertName", hmap);
		return result;
	}
}

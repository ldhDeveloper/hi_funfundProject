package com.hi.funfund.account.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hi.funfund.account.model.dao.AccountDao;
import com.hi.funfund.account.model.vo.Account;
import com.hi.funfund.account.model.vo.Party;

@Service("accountService")
public class AccountServiceIm implements AccountService {

	@Autowired
	AccountDao accountDao;

	@Override
	public Account login(Account account) {
		return accountDao.login(account);
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
	public Account checkId(String Id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Account account) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Account account) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Account account) {
		// TODO Auto-generated method stub
		return accountDao.insert(account);
	}

	@Override
	public int insert(Party seller) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Party selectParty(int pno) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Party loginParty(int ano){
		return accountDao.loginParty(ano);
	}

	@Override
	public Account selectAccount(int ano) {
		return accountDao.selectAccount(ano);
	}

	@Override
	public int update(Party seller) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List selectAccountList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List selectPartyList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List selectGradeList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	// selectPwd 현재 비밀번호 조회

	@Override
	public Account selectOldPwd(int ano, String oldPwd) {
		return accountDao.selectOldPwd(ano, oldPwd);
	}
	
	// updatePwd 새 비밀번호로 바꾸기

	@Override
	public int updatePwd(int ano, String newPwd) {
		System.out.println("PWD Service ano : " + ano + " newPwd : " + newPwd);
		return accountDao.updatePwd(ano, newPwd);
	}
	
	// insertName 이름 등록하기

	@Override
	public int insertName(int ano, String name) {
		return accountDao.insertName(ano, name);
	}

	// updateName 이름 수정
	
	@Override
	public int updateName(int ano, String name) {
		return accountDao.updateName(ano, name);
	}

	// updateNickname 닉네임 수정
	
	@Override
	public int updateNickname(int ano, String nickname) {
		return accountDao.updateNickname(ano, nickname);
	}
	
	// updateEmail 이메일 수정
	
	@Override
	public int updateEmail(String ano, String email) {
		return accountDao.updateEmail(ano, email);
	}
	
	// updateAddress 주소 수정

	@Override
	public int updateSeller(int ano, String phone, String id_no, String address) {
		System.out.println("seller Service ano : " + ano + " phone : " + phone + " id_no : " + id_no + " address : " + address);
		return accountDao.updateSeller(ano, phone, id_no, address);
	}
		
	@Override
	public Account selectThirdPartyUser(Account account) { //타사이트로 가입한 유저 로그인/가입/제어
		Account thirdPartyUser = accountDao.selectThirdPartyUser(account);
		return thirdPartyUser;
	}

	@Override
	public Party selectResult(int ano) {
		return accountDao.selectResult(ano);
	}
}

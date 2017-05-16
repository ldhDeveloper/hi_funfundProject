package com.hi.funfund.account.model.service;

import java.util.List;

import com.hi.funfund.account.model.vo.Account;
import com.hi.funfund.account.model.vo.Party;

public interface AccountService {

	
	
	 Account login(Account account); //로그인
	
	 String findId(Account account); //아이디찾기
	
	 int findPwd(Account account); //비번찾기
	
	 Account checkId(String Id); // 중복확인
	
	 int update(Account account); //회원정보변경 
	
	 int delete(Account account); //회원삭제 신청!
	
	 int insert(Account account); //회원가입
	
	 int insert(Party seller); //판매자 정보등록!
	
	 Party selectParty(int pno); //판매자 정보 보기
	 
	 Party loginParty(int ano); //회원 개인정보 보기
	
	 Account selectAccount(int ano); // 회원정보보기
	
	 int update(Party seller); //판매자정보 업데이트
	
	 List selectAccountList(); //회원리스트보기(관리자) 
	
	 List selectPartyList(); //판매자리스트보기(관리자)
	
	 List selectGradeList(); //등급별리스트보기(관리자)

	Account selectOldPwd(int ano, String oldPwd);

	int updatePwd(int ano, String newPwd);

	
	//미추가된 함수 : 프로젝트별 후원자 리스트

	
}

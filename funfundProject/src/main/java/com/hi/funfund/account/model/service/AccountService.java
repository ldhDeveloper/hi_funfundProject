package com.hi.funfund.account.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.hi.funfund.account.model.vo.Account;
import com.hi.funfund.account.model.vo.Party;

public interface AccountService {

	
	
	 Account login(Account account); //로그인
	
	 String findId(Account account); //아이디찾기
	
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

	Account selectOldPwd(int ano, String oldPwd); // 현재 비밀번호 확인

	int updatePwd(int ano, String newPwd);  // 새 비밀번호로 바꾸기

	int insertName(int ano, String name); // 이름 등록

	int updateName(int ano, String name); // 이름 수정

	int updateNickname(int ano, String nickname); // 닉네임 수정
	
	int updateEmail(String ano, String email); // 이메일 수정

	Account selectThirdPartyUser(Account account); // 타사이트로 가입한 유저 찾기/등록/가입제어

	int updateSeller(int ano, String phone, String id_no, String address); // seller 정보 수정 (휴대폰, 주민등록번호, 주소, 실명확인증표)

	Party selectResult(int ano);

	Account createTempPwd(Account account);
	
	//미추가된 함수 : 프로젝트별 후원자 리스트

	
}

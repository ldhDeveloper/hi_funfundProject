package com.hi.funfund.item.model.service;

import java.sql.Date;
import java.util.List;

import com.hi.funfund.item.model.vo.Item;

public interface ItemService {

	 List AllList(); //리스트 전부 보이기
	
	 List rewardingList(); // 보상형 리스트
	
	 List donationList(); // 기부형 프로젝트 리스트 ... 이름 수정
	
	 List selectFunddingList(); // 회원이 후원한 프로젝트
	
	 List PickList(); // 회원이 찜한 리스트
	
	 List selectMyList(int pro_no); //회원이 작성한 프로젝트
	
	 List selectRecommendList(); //추천 리스트
	
	 List categoryList(String category);  //카테고리별 리스트
	
	 List searchItemWriter(String id); //프로젝트 작성자 검색
	
	 List searchItemTitle(String pname); //프로젝트명 검색
	
	 int insertRewardItem(Item item); //프로젝트 등록신청
	
	 Item selectOne(int pro_no); //프로젝트 상세보기
	
	 List selectOngoingItemList(Date today); // 진행중인 프로젝트 리스트
	
	 List selectEndItemList(Date today); //종료된 프로젝트 리스트
	
	 int[] getGrowRate(int pro_no); // 성장률 표시
	
	 int updateRewardItem(Item item);

	List<Item> top3List();
	
}

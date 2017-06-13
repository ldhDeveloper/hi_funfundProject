package com.hi.funfund.item.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.hi.funfund.item.model.vo.Item;
import com.hi.funfund.item.model.vo.ItemCount;
import com.hi.funfund.item.model.vo.Itemfund;

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

	List<Itemfund> bestList(int pro_no);

	int plusItemLike(int pro_no);

	int minusItemLike(int pro_no);

	List<Item> selectMyItems(int ano);

	List<Item> selectNewProject(int ano); // 개설한 프로젝트

	List<Item> selectRequestItem();


	int updateConfirmStatus(int pro_no);

	int updateRejectStatus(HashMap<String, String> hmap);

	Item selectOneForUpdate(int pro_no);


	List<Item> selectItemList(int ano);

	int updateAcc(Item item);

	int updateStatus(Item item);

	List<Item> selectDeleteRequest();

	int updateDeleteStatus(HashMap<String, String> hmap);

	List<Item> selectEndItem();

	int updateSuccessStatus(int pro_no);

	int updateFailStatus(HashMap<String, String> hmap);

	List<Item> selectNewProject2(int ano);

	List<Item> selectNewProject3(int ano);

	List<Item> selectNewProject4(int ano);

	List<Item> selectSuccessItem();

	int changeBillStatus(HashMap<String, String> hmap);

	List<Item> selectdefaultpast(String dDate);


	List<Item> endeditemsearch(String period);

	List<Item> yearitemsearch(HashMap<String, String> hmap);

	ItemCount selectitemCount();

	List<Item> selectSupportProject(int ano);

	List<Item> selectNewSponProject2(int ano);

	List<Item> selectNewSponProject3(int ano);

	List<Item> selectNewSponProject4(int ano);

	Item selectOne2(int pro_no);

	List<Item> selectMySponItems(int ano);

	String selectCategory(int pro_no);

	List<Item> category3List(String likecategory);

}

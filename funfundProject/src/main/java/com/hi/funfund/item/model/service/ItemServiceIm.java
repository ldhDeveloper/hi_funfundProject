package com.hi.funfund.item.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.funfund.item.model.dao.ItemDao;
import com.hi.funfund.item.model.vo.Item;
import com.hi.funfund.item.model.vo.Itemfund;

@Service("itemService")
public class ItemServiceIm implements ItemService{

	@Autowired
	private ItemDao itemDao;
	

	@Override
	public List<Item> AllList() {
		return itemDao.AllList();
	}

	@Override
	public List rewardingList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List donationList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List selectFunddingList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List PickList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List selectMyList(int pro_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List selectRecommendList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List categoryList(String category) {
		return itemDao.categoryList(category);
	}

	@Override
	public List searchItemWriter(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List searchItemTitle(String pname) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertRewardItem(Item item) {
		int result = itemDao.insertRewardItem(item);
		
		return result;
	}

	@Override
	public Item selectOne(int pro_no) {
		return itemDao.selectOne(pro_no);                                                                                                                                            
	}

	@Override
	public List selectOngoingItemList(Date today) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List selectEndItemList(Date today) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int[] getGrowRate(int pro_no) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int updateRewardItem(Item item){
		int result = itemDao.updateRewardItem(item);
		
		return result;
	}

	@Override
	public List<Item> top3List() {
		// TODO Auto-generated method stub
		return itemDao.top3List();
	}

	@Override
	public List<Itemfund> bestList(int pro_no) {
		return itemDao.bestList(pro_no);
	}

	@Override
	public int plusItemLike(int pro_no) {
		// TODO Auto-generated method stub
		return itemDao.plusItemLike(pro_no);
	}

	@Override
	public int minusItemLike(int pro_no) {
		// TODO Auto-generated method stub
		return itemDao.minusItemLike(pro_no);
	}

	@Override
	public List<Item> selectMyItems(int ano) {
		return itemDao.selectMyItems(ano);
	}
	
	// 개설한 프로젝트
	@Override
	public List<Item> selectNewProject(int ano) {
		return itemDao.selectNewProject(ano);
	}

	@Override
	public List<Item> selectRequestItem() {
		return itemDao.selectRequestItem();
	}
	
	@Override
	public Item selectOneForUpdate(int pro_no){
		return itemDao.selectOneForUpdate(pro_no);
	}

	@Override
	public int updateConfirmStatus(int pro_no) {
		return itemDao.updateConfirmStatus(pro_no);
	}

	@Override
	public int updateRejectStatus(HashMap<String, String> hmap) {
		return itemDao.updateRejectStatus(hmap);
	}
	
	@Override
	public List<Item> selectItemList(int ano){
		return itemDao.selectItemList(ano);
	}
	
	@Override
	public int updateAcc(Item item){
		return itemDao.updateAcc(item);
	}
	
	@Override
	public int updateStatus(Item item){
		return itemDao.updateStatus(item);
	}

	@Override
	public List<Item> selectDeleteRequest() {
		return itemDao.selectDeleteRequest();
	}

	@Override
	public int updateDeleteStatus(HashMap<String, String> hmap) {
		return itemDao.updateDeleteStatus(hmap);
	}

	@Override
	public List<Item> selectEndItem() {
		return itemDao.selectEndItem();
	}

	@Override
	public int updateSuccessStatus(int pro_no) {
		return itemDao.updateSuccessStatus(pro_no);
	}

	@Override
	public int updateFailStatus(HashMap<String, String> hmap) {
		return itemDao.updateFailStatus(hmap);
	}

	@Override
	public List<Item> selectNewProject2(int ano) {
		System.out.println("2 service ano : " + ano);
		return itemDao.selectNewProject2(ano);
	}

	@Override
	public List<Item> selectNewProject3(int ano) {
		return itemDao.selectNewProject3(ano);
	}

	@Override
	public List<Item> selectNewProject4(int ano) {
		return itemDao.selectNewProject4(ano);
  }
  
  @Override
	public List<Item> selectSuccessItem() {
		return itemDao.selectSuccessItem();
	}

	@Override
	public int changeBillStatus(HashMap<String, String> hmap) {
		return itemDao.changeBillStatus(hmap);
	}

	@Override
	public List<Item> selectdefaultpast(String dDate) {
		return itemDao.selectdefaultpast(dDate);
	}

	@Override
	public List<Item> endeditemsearch(String period) {
		return itemDao.endeditemsearch(period);
	}

	@Override
	public List<Item> yearitemsearch(HashMap<String, String> hmap) {
		return itemDao.yearitemsearch(hmap);
	}

	
}

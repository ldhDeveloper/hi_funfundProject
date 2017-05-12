package com.hi.funfund.item.model.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.funfund.item.model.dao.ItemDao;
import com.hi.funfund.item.model.vo.Item;

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
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return null;
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
}

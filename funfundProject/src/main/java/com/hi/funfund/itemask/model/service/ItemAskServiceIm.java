package com.hi.funfund.itemask.model.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.hi.funfund.itemask.model.dao.ItemAskDao;
import com.hi.funfund.itemask.model.vo.ItemAsk;

@Service("itemAskService")
public class ItemAskServiceIm implements ItemAskService {

	@Autowired
	private ItemAskDao itemAskDao;

	@Override
	public int insert(ItemAsk itemAsk) {
		
		return itemAskDao.insert(itemAsk);
	}

	@Override
	public int update(ItemAsk itemAsk) {
		// TODO Auto-generated method stub
		return itemAskDao.update(itemAsk);
	}

	@Override
	public int delete(int ask_no) {
		// TODO Auto-generated method stub
		return itemAskDao.delete(ask_no);
	}

	@Override
	public List<ItemAsk> selectList(int pro_no) {
		// TODO Auto-generated method stub
		return itemAskDao.selectList(pro_no);
	}
}

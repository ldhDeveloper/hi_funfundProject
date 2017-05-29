package com.hi.funfund.itemask.model.service;

import java.util.HashMap;
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
	public int insert(HashMap<String,String> cmap) {
		return itemAskDao.insert(cmap);
	}
	
	@Override
	public int update(HashMap<String,String> umap) {
		return itemAskDao.update(umap);
	}

	@Override
	public int delete(int ask_no) {
		// TODO Auto-generated method stub
		return itemAskDao.delete(ask_no);
	}

	@Override
	public List<ItemAsk> selectList(int pro_no) {
		return itemAskDao.selectList(pro_no);
	}

	@Override
	public int reinsert(HashMap<String, String> cmap) {
		return itemAskDao.reinsert(cmap);
	}

	@Override
	public int redelete(int ask_no) {
		return itemAskDao.redelete(ask_no);
	}

	
}

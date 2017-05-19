package com.hi.funfund.myitem.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.funfund.myitem.model.dao.MyItemDao;
import com.hi.funfund.myitem.model.vo.MyItem;

@Service("myItemService")
public class MyItemServiceIm implements MyItemService{

	@Autowired
	private MyItemDao myItemDao;

	@Override
	public int delete(int mpro_no) {
		
		return myItemDao.delete(mpro_no);
	}

	@Override
	public int insert(HashMap<String, String> hmap) {
		// TODO Auto-generated method stub
		return myItemDao.insert(hmap);
	}

	@Override
	public List<MyItem> select(int ano) {
		return myItemDao.select(ano);
	}

	/*@Override
	public List selectLikes(int ano) {
		return myItemDao.selectLikes(ano);
	}*/
}

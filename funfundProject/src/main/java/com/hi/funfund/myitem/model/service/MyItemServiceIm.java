package com.hi.funfund.myitem.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.funfund.myitem.model.dao.MyItemDao;
import com.hi.funfund.myitem.model.vo.MyItem;

@Service("myItemService")
public class MyItemServiceIm implements MyItemService{

	@Autowired
	private MyItemDao myItemDao;

	@Override
	public int insert(MyItem myItem) {
		
		return myItemDao.insert(myItem);
	}

	@Override
	public int delete(int mpro_no) {
		
		return myItemDao.delete(mpro_no);
	}
}

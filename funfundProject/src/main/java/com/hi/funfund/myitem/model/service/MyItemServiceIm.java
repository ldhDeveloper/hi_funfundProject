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
	public int insertLike(HashMap<String, String> hmap) {
		// TODO Auto-generated method stub
		return myItemDao.insertLike(hmap);
	}

	@Override
	public List<MyItem> selectLike(int ano) {
		return myItemDao.selectLike(ano);
	}

	@Override
	public int deleteLike(HashMap<String, String> hmap) {
		// TODO Auto-generated method stub
		return myItemDao.deleteLike(hmap);
	}

	/*@Override
	public List selectLikes(int ano) {
		return myItemDao.selectLikes(ano);
	}*/
}

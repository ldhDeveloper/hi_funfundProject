package com.hi.funfund.myitem.model.service;

import java.util.HashMap;
import java.util.List;

import com.hi.funfund.item.model.vo.Item;
import com.hi.funfund.myitem.model.vo.MyItem;

public interface MyItemService {
	
	int insertLike(HashMap<String, String> hmap);

	int delete(int mpro_no);

	List<MyItem> selectLike(int ano);

	int deleteLike(HashMap<String, String> hmap);

}

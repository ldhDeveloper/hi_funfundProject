package com.hi.funfund.myitem.model.service;

import java.util.HashMap;
import java.util.List;

import com.hi.funfund.myitem.model.vo.MyItem;

public interface MyItemService {
	
	int insert(HashMap<String, String> hmap);

	int delete(int mpro_no);

	List<MyItem> select(int ano);

}

package com.hi.funfund.itemask.model.service;

import java.util.HashMap;
import java.util.List;

import com.hi.funfund.itemask.model.vo.ItemAsk;

public interface ItemAskService {

	int insert(HashMap<String, String> cmap);

	int update(int pro_no);

	int delete(int ask_no);

	List<ItemAsk> selectList(int pro_no);

}

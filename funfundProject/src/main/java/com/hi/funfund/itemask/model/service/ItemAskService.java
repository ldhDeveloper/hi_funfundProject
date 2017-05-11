package com.hi.funfund.itemask.model.service;

import java.util.List;

import com.hi.funfund.itemask.model.vo.ItemAsk;

public interface ItemAskService {

	int insert(ItemAsk itemAsk);

	int update(ItemAsk itemAsk);

	int delete(int ask_no);

	List<ItemAsk> selectList(int pro_no);

}

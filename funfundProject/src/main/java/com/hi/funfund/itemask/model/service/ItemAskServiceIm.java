package com.hi.funfund.itemask.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.funfund.item.model.dao.ItemDao;

@Service("itemAskService")
public class ItemAskServiceIm implements ItemAskService {

	@Autowired
	private ItemDao itemDao;
}

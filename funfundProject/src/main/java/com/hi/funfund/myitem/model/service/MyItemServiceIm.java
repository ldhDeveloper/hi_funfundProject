package com.hi.funfund.myitem.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.funfund.myitem.model.dao.MyItemDao;

@Service("myItemService")
public class MyItemServiceIm implements MyItemService{

	@Autowired
	private MyItemDao myItemDao;
}

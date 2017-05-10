package com.hi.funfund.fundmenu.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.funfund.fundmenu.model.dao.FundMenuDao;

@Service("fundMenuService")
public class FundMenuServiceIm implements FundMenuService {

	@Autowired
	private FundMenuDao fundMenuDao; 
}

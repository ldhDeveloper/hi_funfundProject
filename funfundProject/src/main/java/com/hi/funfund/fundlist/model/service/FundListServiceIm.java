package com.hi.funfund.fundlist.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.funfund.fundlist.model.dao.FundListDao;


@Service("fundListService")
public class FundListServiceIm implements FundListService {

	@Autowired 
	private FundListDao fundListDao;
}

package com.hi.funfund.fundlist.model.service;

import java.util.List;

import com.hi.funfund.fundlist.model.vo.FundList;

public interface FundListService {

	List<FundList> selectList();

	int insert(FundList fList);

	int update(FundList fList);

}

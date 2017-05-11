package com.hi.funfund.fundmenu.model.service;

import com.hi.funfund.fundmenu.model.vo.FundMenu;

public interface FundMenuService {

	FundMenu selectOne(int pro_no);

	int insert(FundMenu fm);

	int update(FundMenu fm);

	int delete(int pro_no);

}

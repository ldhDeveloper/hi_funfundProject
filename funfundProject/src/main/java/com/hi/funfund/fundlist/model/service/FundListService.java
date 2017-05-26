package com.hi.funfund.fundlist.model.service;

import java.util.List;

import com.hi.funfund.fundlist.model.vo.FundList;
import com.hi.funfund.fundlist.model.vo.Myfunding;
import com.hi.funfund.fundlist.model.vo.Mysponsor;

public interface FundListService {

	List<FundList> selectList();

	int insert(FundList fList);

	int update(FundList fList);

	List<Mysponsor> selectSponsorList(int pro_no);

	List<Myfunding> selectMyfunding(int ano);

	Myfunding selectMyfundingDetail(int fund_no);

	int cancleMyfundingDetail(int fund_no);

}

package com.hi.funfund.fundlist.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.hi.funfund.fundlist.model.vo.FundList;
import com.hi.funfund.fundlist.model.vo.Myfunding;
import com.hi.funfund.fundlist.model.vo.Mysponsor;
import com.hi.funfund.fundlist.model.vo.UpdateSponsor;

public interface FundListService {

	List<FundList> selectList();

	int insert(FundList fList);

	int update(FundList fList);

	List<Mysponsor> selectSponsorList(int pro_no);

	List<Myfunding> selectMyfunding(int ano);

	Myfunding selectMyfundingDetail(int fund_no);

	int cancleMyfundingDetail(int fund_no);

	int changeSupporterList(UpdateSponsor updatesponsor);

	int updateOption(int fund_no, int fundcount);

	int updateDelivery(int fund_no, String recname, String rephone, String deladdress);

	int insertFundingList(ArrayList<HashMap<String, String>> alist);

	List<Myfunding> selectMyfundingSpon(int ano);

	Myfunding selectMyfundingSponDetail(int fund_no);
	
}

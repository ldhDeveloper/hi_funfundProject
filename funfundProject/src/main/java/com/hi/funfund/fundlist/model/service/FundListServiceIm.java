package com.hi.funfund.fundlist.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.funfund.fundlist.model.dao.FundListDao;
import com.hi.funfund.fundlist.model.vo.FundList;
import com.hi.funfund.fundlist.model.vo.Myfunding;
import com.hi.funfund.fundlist.model.vo.Mysponsor;
import com.hi.funfund.fundlist.model.vo.UpdateSponsor;


@Service("fundListService")
public class FundListServiceIm implements FundListService {

	@Autowired 
	private FundListDao fundListDao;

	@Override
	public List<FundList> selectList() {
	
		
		
		return fundListDao.selectList();
	}

	@Override
	public int insert(FundList fList) {
		
		
		
		return fundListDao.insert(fList);
	}

	@Override
	public int update(FundList fList) {
		
		
		
		return fundListDao.update(fList);
	}

	@Override
	public List<Mysponsor> selectSponsorList(int pro_no) {
		return fundListDao.selectSponsorList(pro_no);
	}

	@Override
	public List<Myfunding> selectMyfunding(int ano) {
		return fundListDao.selectMyfunding(ano);
	}

	@Override
	public Myfunding selectMyfundingDetail(int fund_no) {
		return fundListDao.selectMyfundingDetail(fund_no);
	}

	@Override
	public int cancleMyfundingDetail(int fund_no) {
		System.out.println("update Service fund_no : " + fund_no);
		return fundListDao.cancleMyfundingDetail(fund_no);
	}

	@Override
	public int changeSupporterList(UpdateSponsor updatesponsor) {
		return fundListDao.changeSupporterList(updatesponsor);
	}

	// 옵션 변경
	@Override
	public int updateOption(int fund_no, int fundcount) {
		return fundListDao.updateOption(fund_no, fundcount);
	}

	@Override
	public int updateDelivery(int fund_no, String recname, String rephone, String deladdress) {
		System.out.println("updateDelivery service fund_no : " + fund_no + " recname : " + recname + " rephone : " + rephone + " deladdress : " + deladdress);
		return fundListDao.updateDelivery(fund_no, recname, rephone, deladdress);
	}


}

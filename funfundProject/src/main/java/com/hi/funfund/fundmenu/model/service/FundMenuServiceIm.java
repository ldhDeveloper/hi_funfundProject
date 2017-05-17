package com.hi.funfund.fundmenu.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.funfund.fundmenu.model.dao.FundMenuDao;
import com.hi.funfund.fundmenu.model.vo.FundMenu;
import com.hi.funfund.fundmenu.model.vo.ReciveFundMenu;

@Service("fundMenuService")
public class FundMenuServiceIm implements FundMenuService {

	@Autowired
	private FundMenuDao fundMenuDao;

	@Override
	public ArrayList<FundMenu> selectList(int pro_no) {
		return fundMenuDao.selectList(pro_no);
	}

	@Override
	public int insert(FundMenu fm) {

		return fundMenuDao.insert(fm);
	}

	@Override
	public int update(FundMenu fm) {

		return fundMenuDao.update(fm);
	}

	@Override
	public int delete(int pro_no) {

		return fundMenuDao.delete(pro_no);
	}
	@Override
	public int insertOrUpdateFundMenu(FundMenu fmenu){
		return fundMenuDao.insertOrUpdateFundMenu(fmenu);
	}
	
	@Override
	public int insertFundMenu(FundMenu fmenu){
		return fundMenuDao.insertFundMenu(fmenu);
	}
}

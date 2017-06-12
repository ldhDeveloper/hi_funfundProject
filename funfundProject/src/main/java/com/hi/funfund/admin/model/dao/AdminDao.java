package com.hi.funfund.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hi.funfund.admin.model.vo.AccInfo;
import com.hi.funfund.admin.model.vo.CancelInfo;
import com.hi.funfund.admin.model.vo.ProfitHash;

@Repository("adminDao")
public class AdminDao {

	private static final String nameSpace = "adminMapper.";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<AccInfo> selectRequestSeller() {
		List<AccInfo> accList = (List<AccInfo>)sqlSession.selectList(nameSpace + "selectRequestSeller");
		return accList;
	}

	public List<CancelInfo> selectCancelInfo() {
		List<CancelInfo> cList = (List<CancelInfo>) sqlSession.selectList(nameSpace + "selectCancelInfo");
		return cList;
	}

	public List<ProfitHash> totalProfit(String year) {
		List<ProfitHash> pList = (List<ProfitHash>) sqlSession.selectList(nameSpace + "totalProfit", year);
		return pList;
	}

	public List<ProfitHash> categoryProfit(String year) {
		List<ProfitHash> cList = (List<ProfitHash>) sqlSession.selectList(nameSpace + "categoryProfit", year);
		return cList;
	}
	
}

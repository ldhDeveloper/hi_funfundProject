package com.hi.funfund.fundmenu.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hi.funfund.fundmenu.model.vo.FundMenu;

@Repository("fundMenuDao")
public class FundMenuDao {
	
	private static final String nameSpace = "fundMenuMapper.";
	@Autowired
	private SqlSession sqlSession;
	public FundMenu selectOne(int pro_no) {
		// TODO Auto-generated method stub
		return null;
	}
	public int insert(FundMenu fm) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int update(FundMenu fm) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int delete(int pro_no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
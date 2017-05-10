package com.hi.funfund.fundmenu.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("fundMenuDao")
public class FundMenuDao {
	
	private static final String nameSpace = "fundMenuMapper.";
	@Autowired
	private SqlSession sqlSession;

}

package com.hi.funfund.fundlist.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("fundListDao")
public class FundListDao {

	private static final String nameSpace = "fundListMapper.";
	@Autowired
	private SqlSession sqlSession;

}

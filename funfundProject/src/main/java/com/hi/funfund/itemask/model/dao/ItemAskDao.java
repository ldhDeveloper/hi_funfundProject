package com.hi.funfund.itemask.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("itemAskDao")
public class ItemAskDao {
	private static final String nameSpace = "itemAskMapper.";
	@Autowired
	private SqlSession sqlSession;

}

package com.hi.funfund.myitem.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("myItemDao")
public class MyItemDao {
	private static final String nameSpace = "myItemMapper.";
	@Autowired
	private SqlSession sqlSession;

}

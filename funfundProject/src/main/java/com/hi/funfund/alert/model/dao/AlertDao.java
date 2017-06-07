package com.hi.funfund.alert.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository("alertDao")
public class AlertDao {
	private static final String nameSpace = "alertMapper.";
	@Autowired
	private SqlSession sqlSession;
	
	public int checkNewMessage(int ano) {
		return (int) sqlSession.selectOne(nameSpace + "checkNewMessage", ano);
	}

}

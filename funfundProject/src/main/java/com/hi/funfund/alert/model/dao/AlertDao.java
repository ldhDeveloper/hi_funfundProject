package com.hi.funfund.alert.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hi.funfund.alert.model.vo.Alert;
@Repository("alertDao")
public class AlertDao {
	private static final String nameSpace = "alertMapper.";
	@Autowired
	private SqlSession sqlSession;
	
	public int checkNewMessage(int ano) {
		return (int) sqlSession.selectOne(nameSpace + "checkNewMessage", ano);
	}

	public List<Alert> selectList(int ano) {
		
		return sqlSession.selectList(nameSpace + "selectList", ano);
	}

}

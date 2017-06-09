package com.hi.funfund.alert.model.dao;

import java.util.HashMap;
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

	public List<Alert> selectList(HashMap map) {
		
		return sqlSession.selectList(nameSpace + "selectList", map);
	}

	public Alert selectOne(int al_no) {
		
		return (Alert) sqlSession.selectOne(nameSpace + "selectOne", al_no);
	}

	public int updateReadyn(int al_no) {
		
		return sqlSession.update(nameSpace + "updateReadyn", al_no);
	}

	public int deleteAlert(int al_no) {
		
		return sqlSession.delete(nameSpace + "deleteAlert", al_no);
	}

	public int insertAlert(Alert al) {
		
		return sqlSession.insert(nameSpace + "insertAlert", al);
	}

	public int getMessageCount(int ano) {
		
		return (int)sqlSession.selectOne(nameSpace + "getMessageCount", ano);
	}

}

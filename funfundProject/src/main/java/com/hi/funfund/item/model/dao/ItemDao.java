package com.hi.funfund.item.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hi.funfund.itemask.model.vo.ItemAsk;

@Repository("itemDao")
public class ItemDao {
	
	private static final String nameSpace = "itemMapper.";
	@Autowired
	private SqlSession sqlSession;
	
	public int insertRewardItem(int ano){
		int result = sqlSession.insert(nameSpace + "insert", ano);
		if(result > 0){
			sqlSession.commit();
		}else{
			sqlSession.rollback();
		}
		return result;
	}

}

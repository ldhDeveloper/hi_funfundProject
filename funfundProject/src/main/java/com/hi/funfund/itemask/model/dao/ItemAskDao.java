package com.hi.funfund.itemask.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hi.funfund.itemask.model.vo.ItemAsk;

@Repository("itemAskDao")
public class ItemAskDao {
	private static final String nameSpace = "itemAskMapper.";
	@Autowired
	private SqlSession sqlSession;

	public int insert(ItemAsk itemAsk) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int update(ItemAsk itemAsk) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(int ask_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<ItemAsk> selectList(int pro_no) {
		List<ItemAsk> aList = sqlSession.selectList(nameSpace+"selectList", pro_no);
		return aList;
	}

}

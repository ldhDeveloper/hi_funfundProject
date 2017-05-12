package com.hi.funfund.item.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hi.funfund.item.model.vo.Item;

@Repository("itemDao")
public class ItemDao {
	
	private static final String nameSpace = "itemMapper.";
	@Autowired
	private SqlSession sqlSession;
	
	public int insertRewardItem(Item item){
		int pro_no = 0;
		System.out.println("실행전 : " + item.getPro_no());
		int result = sqlSession.insert(nameSpace + "insert", item);
		System.out.println("실행후 : " + item.getPro_no());
		
		if(result > 0){
			pro_no = item.getPro_no();
		}
		
		return pro_no;
	}

	public List AllList() {
		/*List<Item> iList = sqlSession.selectList(,);*/
		return null;
	}
	
}

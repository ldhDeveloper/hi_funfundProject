package com.hi.funfund.myitem.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hi.funfund.myitem.model.vo.MyItem;

@Repository("myItemDao")
public class MyItemDao {
	private static final String nameSpace = "myItemMapper.";
	@Autowired
	private SqlSession sqlSession;
	public int delete(int mpro_no) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int insert(HashMap<String, String> hmap) {
		int result = sqlSession.insert(nameSpace + "insertMyitem", hmap);
		return result;
	}

	/*public List selectLikes(int ano) {
		List likeList = sqlSession.selectList(nameSpace + "selectLikes", ano);
		return likeList;
	}*/

	public List select(int ano) {
		List likeList = sqlSession.selectList(nameSpace + "select", ano);
		return null;
	}

}

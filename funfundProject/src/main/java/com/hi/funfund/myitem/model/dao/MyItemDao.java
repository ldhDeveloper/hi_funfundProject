package com.hi.funfund.myitem.model.dao;

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
	public int insert(MyItem myItem) {
		// TODO Auto-generated method stub
		return 0;
	}

}

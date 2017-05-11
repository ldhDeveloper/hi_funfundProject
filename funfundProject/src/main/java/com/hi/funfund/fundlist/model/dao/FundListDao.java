package com.hi.funfund.fundlist.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hi.funfund.fundlist.model.vo.FundList;


@Repository("fundListDao")
public class FundListDao {

	private static final String nameSpace = "fundListMapper.";
	@Autowired
	private SqlSession sqlSession;
	public List<FundList> selectList() {
		// TODO Auto-generated method stub
		return null;
	}
	public int insert(FundList fList) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int update(FundList fList) {
		// TODO Auto-generated method stub
		return 0;
	}

}

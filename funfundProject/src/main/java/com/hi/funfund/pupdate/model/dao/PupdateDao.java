package com.hi.funfund.pupdate.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hi.funfund.pupdate.model.vo.Pupdate;

@Repository("pUpdateDao")
public class PupdateDao {

	private static final String nameSpace = "pUpdateMapper.";
	@Autowired
	private SqlSession sqlSession;
	public List<Pupdate> selectList(int pro_no) {
		// TODO Auto-generated method stub
		return null;
	}
	public int insert(Pupdate pUpdate) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int delete(int upno) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int update(Pupdate pUpdate) {
		// TODO Auto-generated method stub
		return 0;
	}
}

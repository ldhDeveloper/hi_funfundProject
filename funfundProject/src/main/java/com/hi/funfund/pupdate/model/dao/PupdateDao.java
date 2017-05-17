package com.hi.funfund.pupdate.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hi.funfund.pupdate.model.vo.Pupdate;

@Repository("PupdateDao")
public class PupdateDao {

	private static final String nameSpace = "pupdateMapper.";
	@Autowired
	private SqlSession sqlSession;

	public List<Pupdate> selectList(int pro_no) {
		List<Pupdate> pList = sqlSession.selectList(nameSpace + "selectList", pro_no);
		return pList;
	}

	public int insert(Pupdate Pupdate) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(int upno) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int update(Pupdate Pupdate) {
		// TODO Auto-generated method stub
		return 0;
	}
}

package com.hi.funfund.pupdate.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("pUpdateDao")
public class PupdateDao {

	private static final String nameSpace = "pUpdateMapper.";
	@Autowired
	private SqlSession sqlSession;
}

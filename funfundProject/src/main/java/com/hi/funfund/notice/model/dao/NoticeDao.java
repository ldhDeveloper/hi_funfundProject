package com.hi.funfund.notice.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("noticeDao")
public class NoticeDao {

	private static final String nameSpace = "noticeMapper.";
	@Autowired
	private SqlSession sqlSession;

}

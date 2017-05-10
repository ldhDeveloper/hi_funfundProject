package com.hi.funfund.attachment.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("attachmentDao")
public class AttachmentDao {
	
	private static final String nameSpace = "attachmentMapper.";
	@Autowired
	private SqlSession sqlSession;

}

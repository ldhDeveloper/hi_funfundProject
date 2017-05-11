package com.hi.funfund.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hi.funfund.notice.model.vo.Notice;

@Repository("noticeDao")
public class NoticeDao {

	private static final String nameSpace = "noticeMapper.";
	@Autowired
	private SqlSession sqlSession;
	public List selectList(int bno, int page) {
		// TODO Auto-generated method stub
		return null;
	}
	public List searchTitle(int bno, int page, String ntitle) {
		// TODO Auto-generated method stub
		return null;
	}
	public Notice selectOne(int nno) {
		// TODO Auto-generated method stub
		return null;
	}
	public int update(Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int delete(int nno) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int insert(Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}
	


}

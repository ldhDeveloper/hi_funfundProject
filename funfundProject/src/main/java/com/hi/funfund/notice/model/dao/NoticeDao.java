package com.hi.funfund.notice.model.dao;

import java.util.HashMap;
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
	public List<Notice> selectList(HashMap map) {
		
		List<Notice> nList = sqlSession.selectList(nameSpace+"selectList", map);
		
		
		return nList;
	}
	public List<Notice> searchTitle(Notice notice, int page) {
		int startNumber = (page * 10 +1) -10;
		int endNumber = startNumber +10; 
		HashMap map = new HashMap();
		map.put("bname", notice.getBname());
		map.put("sNum", startNumber);
		map.put("eNum", endNumber);
		map.put("title", notice.getNtitle());
		List<Notice> nList = (List<Notice>)sqlSession.selectList(nameSpace+"searchTitle", map);
		return nList;
	}
	public Notice selectOne(int nno) {
		
		return (Notice)sqlSession.selectOne(nameSpace + "selectOne", nno);
	}
	public int update(Notice notice) {
		
		return sqlSession.update(nameSpace+"update", notice);
	}
	public int delete(int nno) {
		
		return sqlSession.delete(nameSpace+"delete", nno);
	}
	public int insert(Notice notice) {
		
		return sqlSession.insert(nameSpace+"insert", notice);
	}
	public int getListCount(Notice notice) {
	
		return (int)sqlSession.selectOne("getListCount", notice);
	}
	public int getListCountWithTitle(Notice notice) {
		
		return (int)sqlSession.selectOne("getListCountWithTitle", notice);
	}
	public List<Notice> selectDetailList(int nno) {
	
		return (List<Notice>)sqlSession.selectList(nameSpace+"selectDetailList", nno);
	}
	public int getReplyCount(int nno) {
		
		return (int)sqlSession.selectOne(nameSpace+"getReplyCount", nno);
	}
	public int upReadCount(int nno) {
		
		return sqlSession.update(nameSpace+"upReadCount", nno);
	}
	


}

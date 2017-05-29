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
			
		System.out.println(nList);
		return nList;
	}
	public List<Notice> searchTitle(int bno, int page, String ntitle) {
		int startNumber = (page * 10 +1) -10;
		int endNumber = startNumber +10; 
		HashMap map = new HashMap();
		map.put("bno", bno);
		map.put("sNum", startNumber);
		map.put("eNum", endNumber);
		map.put("title", ntitle);
		List<Notice> nList = (List<Notice>)sqlSession.selectList(nameSpace+"searchTitle", map);
		return nList;
	}
	public Notice selectOne(int nno) {
		
		return (Notice)sqlSession.selectOne(nameSpace + "selectOne", nno);
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
	public int getListCount(int bno, int upbno) {
	
		HashMap map = new HashMap();
		map.put("bno", bno);
		map.put("upbno", upbno);
		return (int)sqlSession.selectOne("getListCount", map);
	}
	public int getListCountWithTitle(int bno, String nTitle) {
		HashMap map = new HashMap();
		map.put("bno", bno);
		map.put("title", nTitle);
		return (int)sqlSession.selectOne("getListCountWithTitle", map);
	}
	public List<Notice> selectDetailList(HashMap map) {
	
		return (List<Notice>)sqlSession.selectList(nameSpace+"selectDetailList", map);
	}
	public int getReplyCount(int nno) {
		
		return (int)sqlSession.selectOne(nameSpace+"getReplyCount", nno);
	}
	


}

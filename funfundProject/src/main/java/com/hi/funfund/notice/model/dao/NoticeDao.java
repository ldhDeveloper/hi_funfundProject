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
	public List<Notice> selectList(int bno, int page) {
		int startNumber = (page * 10 +1) -10;
		int endNumber = startNumber +10; 
		HashMap map = new HashMap();
		map.put("bno", bno);
		map.put("sNum", startNumber);
		map.put("eNum", endNumber);
		List<Notice> nList = sqlSession.selectList(nameSpace+"selectList", map);
			
		return nList;
	}
	public List<Notice>  searchTitle(int bno, int page, String ntitle) {
		
		HashMap map = new HashMap();
		map.put("bno", bno);
		map.put("page", page);
		map.put("ntitle", ntitle);
		List<Notice> nList = (List<Notice>)sqlSession.selectList(nameSpace+"searchTitle", map);
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
	public int getListCount(int bno) {
	
		return (int)sqlSession.selectOne("getListCount", bno);
	}
	


}

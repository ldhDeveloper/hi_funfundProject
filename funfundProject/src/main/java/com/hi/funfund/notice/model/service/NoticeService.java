package com.hi.funfund.notice.model.service;

import java.util.HashMap;
import java.util.List;


import com.hi.funfund.notice.model.vo.Notice;

public interface NoticeService {

	
	List selectList(HashMap map);
	List searchTitle(int bno, int page, String nTitle);
	Notice selectOne(int nno);
	int update(Notice notice);
	int delete(int nno);
	int insert(Notice notice);
	int getListCount(int bno, int upbno);
	int getListCountWithTitle(int bno, String nTitle);
	List<Notice> selectDetailList(HashMap map);
	int getReplyCount(int nno);
	

	
	
	
	
	
	
}

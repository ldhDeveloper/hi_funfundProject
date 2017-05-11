package com.hi.funfund.notice.model.service;

import java.util.List;


import com.hi.funfund.notice.model.vo.Notice;

public interface NoticeService {

	
	List selectList(int bno ,int page);
	List searchTitle(int bno, int page, String nTitle);
	Notice selectOne(int nno);
	int update(Notice notice);
	int delete(int nno);
	int insert(Notice notice);

	
	
	
	
	
	
}

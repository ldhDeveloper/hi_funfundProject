package com.hi.funfund.board.model.service;

import java.util.List;

import com.hi.funfund.board.model.vo.Notice;

public interface NoticeService {

	
	List selectList(int bno ,int page, int limit);
	List searchTitle(int bno, String ntitle);
	Notice selectOne(int nno);
	int update(Notice notice);
	int delete(int nno);
	int insert(Notice notice);
	int addReadCount(int nno);
	
	
	
	
	
	
}

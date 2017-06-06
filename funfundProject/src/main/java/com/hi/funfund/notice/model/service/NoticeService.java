package com.hi.funfund.notice.model.service;

import java.util.HashMap;
import java.util.List;


import com.hi.funfund.notice.model.vo.Notice;

public interface NoticeService {

	
	List selectList(HashMap map);
	List searchTitle(Notice notice, int page);
	Notice selectOne(int nno);
	int update(Notice notice);
	int delete(int nno);
	int insert(Notice notice);
	int getListCount(Notice notice);
	List<Notice> selectDetailList(int nno);
	int getReplyCount(int nno);
	int upReadCount(int nno);

	
	
	
	
	
	
}

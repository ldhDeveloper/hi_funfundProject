package com.hi.funfund.notice.model.service;

import java.util.HashMap;
import java.util.List;


import com.hi.funfund.notice.model.vo.Notice;

public interface NoticeService {

	
	List selectList(HashMap map);
	List searchTitle(String bname, int page, String nTitle);
	Notice selectOne(int nno);
	int update(Notice notice);
	int delete(int nno);
	int insert(Notice notice);
	int getListCount(String bname, int upbno);
	int getListCountWithTitle(String bname, String nTitle);
	List<Notice> selectDetailList(int nno);
	int getReplyCount(int nno);
	int upReadCount(int nno);

	
	
	
	
	
	
}

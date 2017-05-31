package com.hi.funfund.notice.model.service;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.funfund.notice.model.dao.NoticeDao;
import com.hi.funfund.notice.model.vo.Notice;

@Service()
public class NoticeServiceIm implements NoticeService{

	@Autowired
	NoticeDao noticeDao;

	@Override
	public List selectList(HashMap map) {
		
		return noticeDao.selectList(map);
	}

	@Override
	public List searchTitle(String bname, int page, String ntitle) {
	
		return noticeDao.searchTitle(bname, page, ntitle);
	}

	@Override
	public Notice selectOne(int nno) {
		
		return noticeDao.selectOne(nno);
	}

	@Override
	public int update(Notice notice) {
				
		return noticeDao.update(notice);
	}

	@Override
	public int delete(int nno) {
		
		return noticeDao.delete(nno);
	}

	@Override
	public int insert(Notice notice) {
		
		return noticeDao.insert(notice);
	}

	@Override
	public int getListCount(String bname, int upbno) {
		
		return noticeDao.getListCount(bname, upbno);
	}

	@Override
	public int getListCountWithTitle(String bname, String nTitle) {
		
		return noticeDao.getListCountWithTitle(bname, nTitle);
	}

	@Override
	public List<Notice> selectDetailList(int nno) {
		
		return noticeDao.selectDetailList(nno);
	}

	@Override
	public int getReplyCount(int nno) {
		
		return noticeDao.getReplyCount(nno);
	}

	@Override
	public int upReadCount(int nno) {
		
		return noticeDao.upReadCount(nno);
	}

	
}

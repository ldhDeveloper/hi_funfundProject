package com.hi.funfund.notice.model.service;

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
	public List selectList(int bno, int page) {
		
		return noticeDao.selectList(bno, page);
	}

	@Override
	public List searchTitle(int bno, int page, String ntitle) {
	
		return noticeDao.searchTitle(bno, page, ntitle);
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
	public int getListCount(int bno) {
		
		return noticeDao.getListCount(bno);
	}

	
}

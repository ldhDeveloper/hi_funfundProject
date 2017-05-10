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
	public List selectList(int bno, int page, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List searchTitle(int bno, String ntitle) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notice selectOne(int nno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int nno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addReadCount(int nno) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}

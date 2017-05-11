package com.hi.funfund.pupdate.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.funfund.pupdate.model.dao.PupdateDao;
import com.hi.funfund.pupdate.model.vo.Pupdate;

@Service("pUpdateService")
public class PupdateServiceIm implements PupdateService{

	@Autowired
	private PupdateDao pUpdateDao;

	@Override
	public List<Pupdate> selectList(int pro_no) {
		
		return pUpdateDao.selectList(pro_no);
	}

	@Override
	public int insert(Pupdate pUpdate) {
		// TODO Auto-generated method stub
		return pUpdateDao.insert(pUpdate);
	}

	@Override
	public int update(Pupdate pUpdate) {
		// TODO Auto-generated method stub
		return pUpdateDao.update(pUpdate);
	}

	@Override
	public int delete(int upno) {
		// TODO Auto-generated method stub
		return pUpdateDao.delete(upno);
	}
}

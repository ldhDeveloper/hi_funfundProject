package com.hi.funfund.pupdate.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.funfund.pupdate.model.dao.PupdateDao;
import com.hi.funfund.pupdate.model.vo.Pupdate;

@Service("PupdateService")
public class PupdateServiceIm implements PupdateService{

	@Autowired
	private PupdateDao PupdateDao;

	@Override
	public List<Pupdate> selectList(int pro_no) {
		return  PupdateDao.selectList(pro_no);
	}

	@Override
	public int insert(Pupdate pUpdate) {
		// TODO Auto-generated method stub
		return  PupdateDao.insert(pUpdate);
	}

	@Override
	public int update(Pupdate pUpdate) {
		// TODO Auto-generated method stub
		return  PupdateDao.update(pUpdate);
	}

	@Override
	public int delete(int upno) {
		// TODO Auto-generated method stub
		return  PupdateDao.delete(upno);
	}
}

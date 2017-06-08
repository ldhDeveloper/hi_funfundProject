package com.hi.funfund.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.funfund.admin.model.dao.AdminDao;
import com.hi.funfund.admin.model.vo.AccInfo;
import com.hi.funfund.admin.model.vo.CancelInfo;

@Service("adminService")
public class AdminServiceIm implements AdminService{

	@Autowired
	AdminDao adminDao;
	
	@Override
	public List<AccInfo> selectRequestSeller() {
		return adminDao.selectRequestSeller();
	}

	@Override
	public List<CancelInfo> selectCancelInfo() {
		return adminDao.selectCancelInfo();
	}

	

}

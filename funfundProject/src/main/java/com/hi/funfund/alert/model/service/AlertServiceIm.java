package com.hi.funfund.alert.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.funfund.alert.model.dao.AlertDao;
import com.hi.funfund.alert.model.vo.Alert;
import com.hi.funfund.attachment.model.dao.AttachmentDao;

@Service("alertService")



public class AlertServiceIm implements AlertService{

	@Autowired
	AlertDao alertDao;
	
	public int checkNewMessage(int ano){
		int count = alertDao.checkNewMessage(ano);
		System.out.println("msgcount : " + count);
		return count;
	}
	
	public List<Alert> selectList(HashMap map){
		return alertDao.selectList(map);
	}
	
	public Alert selectOne(int al_no){
		return alertDao.selectOne(al_no);
	}
	
	public int updateReadyn(int al_no){
		return alertDao.updateReadyn(al_no);
	}
	
	public int deleteAlert(int al_no){
		return alertDao.deleteAlert(al_no);
	}

	@Override
	public int insertAlert(Alert al) {
		return alertDao.insertAlert(al);
	}

	@Override
	public int getmessageCount(int ano) {
		
		return alertDao.getMessageCount(ano);
	}
}

package com.hi.funfund.alert.model.service;

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
		return alertDao.checkNewMessage(ano);
	}
	
	public List<Alert> selectList(int ano){
		return alertDao.selectList(ano);
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
}

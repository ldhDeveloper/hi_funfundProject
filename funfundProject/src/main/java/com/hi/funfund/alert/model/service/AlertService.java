package com.hi.funfund.alert.model.service;

import java.util.HashMap;
import java.util.List;

import com.hi.funfund.alert.model.vo.Alert;

public interface AlertService {

	int checkNewMessage(int ano);

	List<Alert> selectList(HashMap map);

	Alert selectOne(int al_no);

	int updateReadyn(int al_no);

	int deleteAlert(int al_no);

	int insertAlert(Alert al);

}

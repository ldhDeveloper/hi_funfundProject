package com.hi.funfund.alert.model.service;

import java.util.List;

import com.hi.funfund.alert.model.vo.Alert;

public interface AlertService {

	int checkNewMessage(int ano);

	List<Alert> selectList(int ano);

}

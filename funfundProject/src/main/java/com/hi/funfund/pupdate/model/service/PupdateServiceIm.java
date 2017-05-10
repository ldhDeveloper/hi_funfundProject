package com.hi.funfund.pupdate.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.funfund.pupdate.model.dao.PupdateDao;

@Service("pUpdateService")
public class PupdateServiceIm implements PupdateService{

	@Autowired
	private PupdateDao pUpdateDao;
}

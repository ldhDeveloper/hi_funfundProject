package com.hi.funfund.attachment.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.funfund.attachment.model.dao.AttachmentDao;

@Service("AttachmentService")

public class AttachmentServiceIm implements AttachmentService {


	
@Autowired
AttachmentDao attchmentDao;

@Override
public int upload() {
	// TODO Auto-generated method stub
	return 0;
}

@Override
public int delete() {
	// TODO Auto-generated method stub
	return 0;
}

@Override
public void download(int fno) {
	// TODO Auto-generated method stub
	
}
	
	
	
}

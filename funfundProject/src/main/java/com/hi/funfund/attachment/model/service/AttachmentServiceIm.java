package com.hi.funfund.attachment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.funfund.attachment.model.dao.AttachmentDao;
import com.hi.funfund.attachment.model.vo.Attachment;

@Service("attachmentService")

public class AttachmentServiceIm implements AttachmentService {

	
@Autowired
AttachmentDao attachmentDao;

@Override
public int insert(Attachment attachment) {
	
	return attachmentDao.insert(attachment);
}

@Override
public int delete(int fno) {
	
	return attachmentDao.delete(fno);
}

@Override
public List<Attachment> selectList(int ref_no) {

	return attachmentDao.selectList(ref_no);
}


	
	
	
}

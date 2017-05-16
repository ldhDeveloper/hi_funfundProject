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

/*@Override
public int insertImgMyProfile(Attachment attachment) {
	
	int result = 0;

	result = attachmentDao.insertImgMyProfile(attachment);
	
	return result;
}
*/
@Override
public int insertProfileImage(Attachment vo) {
	
	int result = 0;
	
	result = attachmentDao.insertProfileImage(vo);
	
	return result;
	// TODO Auto-generated method stub
	
}

@Override
public int updateProfileImage(Attachment vo) {
	
	int result = 0;
	
	result = attachmentDao.updateProfileImage(vo);
	return result;
	// TODO Auto-generated method stub
	
}


	
	
	
}

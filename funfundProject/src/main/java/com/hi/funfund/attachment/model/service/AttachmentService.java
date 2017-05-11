package com.hi.funfund.attachment.model.service;

import java.util.List;

import com.hi.funfund.attachment.model.vo.Attachment;

public interface AttachmentService {

	
	int insert(Attachment attachment);

	int delete(int fno);

	List<Attachment> selectList(int ref_no);
}

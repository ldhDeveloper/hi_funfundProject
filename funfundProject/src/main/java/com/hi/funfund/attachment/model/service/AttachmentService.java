package com.hi.funfund.attachment.model.service;

import java.util.HashMap;
import java.util.List;

import com.hi.funfund.attachment.model.vo.Attachment;

public interface AttachmentService {

	
	int insert(Attachment attachment);

	int delete(int fno);

	List<Attachment> selectList(int ref_no);
	
	//int insertImgMyProfile(Attachment attachment);

	int insertProfileImage(Attachment vo);

	int updateProfileImage(Attachment vo);

	int accountProfileImage(HashMap<String, String> hmap);

	int insertItemImages(int pro_no);

	int updateTitleImage(Attachment att);

	int updateMakerImage(Attachment att);
	
}

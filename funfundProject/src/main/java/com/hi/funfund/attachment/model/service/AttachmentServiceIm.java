package com.hi.funfund.attachment.model.service;

import java.util.HashMap;
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
	
	//detail리스트에 slide 이미지
	@Override
	public List<Attachment> selectimgList(int pro_no) {
		return attachmentDao.selectimgList(pro_no);
	}

	/*
	 * @Override public int insertImgMyProfile(Attachment attachment) {
	 * 
	 * int result = 0;
	 * 
	 * result = attachmentDao.insertImgMyProfile(attachment);
	 * 
	 * return result; }
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

	@Override
	public int accountProfileImage(HashMap<String, String> hmap) {
		int result = 0;

		result = attachmentDao.accountProfileImage(hmap);
		return result;
	}

	@Override
	public int insertItemImages(int pro_no){
		return attachmentDao.insertItemImages(pro_no);
	}
	
	@Override
	public int updateTitleImage(Attachment att){
		return attachmentDao.updateTitleImage(att);
	}
	
	@Override
	public int updateMakerImage(Attachment att){
		return attachmentDao.updateMakerImage(att);
	}
	
	@Override
	public int insertSlideImages(Attachment att){
		return attachmentDao.insertSlideImages(att);
	}

	// insertIdImage seller 실명확인 증표 등록
	@Override
	public int insertIdImage(Attachment vo) {
		return attachmentDao.insertIdImage(vo);
	}

	// updateIdImage seller 실명확인 증표 수정
	@Override
	public int updateIdImage(Attachment vo) {
		return attachmentDao.updateIdImage(vo);
	}

	@Override
	public int partyIdImage(HashMap<String, String> hmap) {
		int result = attachmentDao.partyIdImage(hmap);
		return result;
	}

	@Override
	public List<Attachment> selectTempImage(int pro_no) {
		List<Attachment> alist = attachmentDao.selectimgList(pro_no);
		return alist;
	}
}

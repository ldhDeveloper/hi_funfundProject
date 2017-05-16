package com.hi.funfund.attachment.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hi.funfund.attachment.model.vo.Attachment;

@Repository("attachmentDao")
public class AttachmentDao {
	
	private static final String nameSpace = "attachmentMapper.";
	@Autowired
	private SqlSession sqlSession;
	public int insert(Attachment attachment) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int delete(int fno) {
		// TODO Auto-generated method stub
		return 0;
	}
	public List<Attachment> selectList(int ref_no) {
		// TODO Auto-generated method stub
		return null;
	}	
	
	/*public int insertImgMyProfile(Attachment attachment) {
		int result = sqlSession.insert("myprofileImg", attachment);
		return result;
	}*/
	public int insertProfileImage(Attachment vo) {
		int result = sqlSession.insert("insertprofileImage", vo);
		return result;
	}
	public int updateProfileImage(Attachment vo) {
		int result = sqlSession.update("updateprofileImage", vo);
		return result;
	}
	public int accountProfileImage(HashMap<String, String> hmap) {
		int result = sqlSession.update("accountProfileImage", hmap);
		return result;
	}

}

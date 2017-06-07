package com.hi.funfund.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hi.funfund.admin.model.vo.AccInfo;

@Repository("adminDao")
public class AdminDao {

	private static final String nameSpace = "adminMapper.";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<AccInfo> selectRequestSeller() {
		List<AccInfo> accList = (List<AccInfo>)sqlSession.selectList(nameSpace + "selectRequestSeller");
		return accList;
	}
	
}

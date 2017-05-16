package com.hi.funfund.fundmenu.model.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hi.funfund.fundmenu.model.vo.FundMenu;
import com.hi.funfund.fundmenu.model.vo.ReciveFundMenu;

@Repository("fundMenuDao")
public class FundMenuDao {

	private static final String nameSpace = "fundMenuMapper.";
	@Autowired
	private SqlSession sqlSession;

	public List<FundMenu> selectList(int pro_no) {
		System.out.println("pro: "+pro_no);
		List<FundMenu> mList =  sqlSession.selectList("selectMlist", pro_no);
		System.out.println("mlist: "+mList);
		return mList;
	}

	public int insert(FundMenu fm) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int update(FundMenu fm) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(int pro_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertOrUpdateFundMenu(FundMenu fmenu) {
		System.out.println("오니?");
		int result = 0;
		int mno = 0;
		
		FundMenu fm = (FundMenu) sqlSession.selectOne(nameSpace + "selectMno", fmenu);
		if(fm != null){
			mno = fm.getMno();
		}
		
		
		if(mno == 0){
			System.out.println("입력되니?");
			result = sqlSession.insert(nameSpace + "insertFM", fmenu);
		}else{
			fmenu.setMno(mno);
			result = sqlSession.update(nameSpace + "updateFM", fmenu);
		}
		
		
		
		return result;
	}
}

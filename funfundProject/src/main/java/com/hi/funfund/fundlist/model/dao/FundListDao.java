package com.hi.funfund.fundlist.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hi.funfund.fundlist.model.vo.FundList;
import com.hi.funfund.fundlist.model.vo.Myfunding;
import com.hi.funfund.fundlist.model.vo.Mysponsor;
import com.hi.funfund.fundlist.model.vo.UpdateSponsor;


@Repository("fundListDao")
public class FundListDao {

	private static final String nameSpace = "fundListMapper.";
	@Autowired
	private SqlSession sqlSession;
	public List<FundList> selectList() {
		// TODO Auto-generated method stub
		return null;
	}
	public int insert(FundList fList) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int update(FundList fList) {
		// TODO Auto-generated method stub
		return 0;
	}
	public List<Mysponsor> selectSponsorList(int pro_no) {
		System.out.println("나와랏! : " + pro_no);
		List<Mysponsor> mList = sqlSession.selectList(nameSpace+"sponsorList", pro_no);
		return mList;
	}
	public List<Myfunding> selectMyfunding(int ano) {
		List<Myfunding> list = sqlSession.selectList(nameSpace+"selectMyfunding", ano);
		return list;
	}
	public Myfunding selectMyfundingDetail(int fund_no) {
		Myfunding myfunding = (Myfunding)sqlSession.selectOne("selectMyfundingDetail", fund_no);
		return myfunding;
	}

	public int cancleMyfundingDetail(int fund_no) {
		System.out.println("update Dao 1 fund_no : " + fund_no);
		int result = sqlSession.update(nameSpace+"cancleMyfundingDetail", fund_no);
		System.out.println("dao result : " + result);
		System.out.println("update Dao 2 fund_no : " + fund_no);
		return result;
	}
	public int changeSupporterList(UpdateSponsor updatesponsor) {
		int result = 0;
		for(int i = 0; i < updatesponsor.getFund_no().size(); i++){
			HashMap<String, String> hmap = new HashMap<String, String>();
			hmap.put("fund_no", updatesponsor.getFund_no().get(i).toString());
			hmap.put("del_no", updatesponsor.getDel_no().get(i).toString());
			result += sqlSession.update(nameSpace+"changeSupporterList", hmap) ;
		}
		return result;
	}
	

}

package com.hi.funfund.item.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hi.funfund.item.model.vo.Item;
import com.hi.funfund.item.model.vo.Itemfund;

@Repository("itemDao")
public class ItemDao {
	
	private static final String nameSpace = "itemMapper.";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertRewardItem(Item item){
		int pro_no = 0;
		System.out.println("실행전 : " + item.getPro_no());
		int result = sqlSession.insert(nameSpace + "insert", item);
		System.out.println("실행후 : " + item.getPro_no());
		
		if(result > 0){
			pro_no = item.getPro_no();
		}
		
		return pro_no;
	}

	public List AllList() {
		List<Item> iList = (List<Item>) sqlSession.selectList(nameSpace+"selectList");
		System.out.println("iList:"+iList.get(0));
		return iList;
	}

	public Item selectOne(int pro_no) {
		System.out.println("no: "+pro_no);
		Item result = (Item) sqlSession.selectOne(nameSpace+"selectOne", pro_no); 
		System.out.println("result22222: "+result);
		return result;
	}

	public int updateRewardItem(Item item) {
		System.out.println("프로젝트번호 : " + item.getPro_no());
		int result = sqlSession.update(nameSpace + "tempupdate", item);
		
		return result;
	}

	public List<Item> top3List() {
		List<Item> top3List = (List<Item>) sqlSession.selectList(nameSpace+"top3List");
		System.out.println("top3List :"+top3List.get(0));
		return top3List;
	}

	public List<Itemfund> bestList(int pro_no) {
		List bestList = sqlSession.selectList(nameSpace+"bestList", pro_no);
		return bestList;
	}

	public int selectAllItem() {
		// TODO Auto-generated method stub
		return 0;
	}

	public List categoryList(String category) {
		List<Item> iList = (List<Item>) sqlSession.selectList(nameSpace+"selectCategory", category);
		//System.out.println("iList:"+iList.get(0));
		return iList;
	}

	public int plusItemLike(int pro_no) {
		int result = sqlSession.update(nameSpace + "plusItemLike", pro_no);
		return result;
	}

	public int minusItemLike(int pro_no) {
		int result = sqlSession.update(nameSpace + "minusItemLike", pro_no);
		return result;
	}

	public List<Item> selectMyItems(int ano) {
		List<Item> iList = (List<Item>) sqlSession.selectList(nameSpace + "selectMyItems", ano);
		return iList;
	}


	public List<Item> selectNewProject(int ano) {
		List<Item> iList = (List<Item>) sqlSession.selectList(nameSpace + "selectNewProject", ano);
		return iList;
	}
  
	public List<Item> selectRequestItem() {
		List<Item> iList = (List<Item>) sqlSession.selectList(nameSpace + "selectRequestItem");
		return iList;
	}

	public int updateConfirmStatus(int pro_no) {
		int result = sqlSession.update(nameSpace + "updateConfirmStatus", pro_no);
		return result;
	}

	public int updateRejectStatus(HashMap<String, String> hmap) {
		int result = sqlSession.update(nameSpace + "updateRejectStatus", hmap);
		return result;
  }
	public Item selectOneForUpdate(int pro_no) {
		Item item = (Item) sqlSession.selectOne(nameSpace + "selectOneForUpdate", pro_no);
		return item;
	}

	public List<Item> selectItemList(int ano) {
		List<Item> plist = (List<Item>) sqlSession.selectList(nameSpace + "selectItemList", ano);
		return plist;
	}

	public int updateAcc(Item item) {
		int result = sqlSession.update(nameSpace + "accupdate", item);
		return result;
	}

	public int updateStatus(Item item) {
		int result = sqlSession.update(nameSpace + "updatestatus", item);
    return result;
  }
  
	public List<Item> selectDeleteRequest() {
		List<Item> iList = (List<Item>) sqlSession.selectList(nameSpace + "selectDeleteRequest");
		return iList;
	}

	public int updateDeleteStatus(HashMap<String, String> hmap) {
		int result = sqlSession.update(nameSpace + "updateDeleteStatus", hmap);
		return result;
	}

	public List<Item> selectEndItem() {
		List<Item> iList = (List<Item>) sqlSession.selectList(nameSpace + "selectEndItem");
		return iList;
	}

	public int updateSuccessStatus(int pro_no) {
		int result = sqlSession.update(nameSpace + "updateSuccessStatus", pro_no);
		return result;
	}

	public int updateFailStatus(HashMap<String, String> hmap) {
		int result = sqlSession.update(nameSpace + "updateFailStatus", hmap);
		return result;
	}

	public List<Item> selectNewProject2(int ano) {
		List<Item> iList = (List<Item>) sqlSession.selectList(nameSpace + "selectNewProject2", ano);
		System.out.println("2 dao ano : " + ano + " iList : " + iList);
		return iList;
	}

	public List<Item> selectNewProject3(int ano) {
		List<Item> iList = (List<Item>) sqlSession.selectList(nameSpace + "selectNewProject3", ano);
		return iList;
	}

	public List<Item> selectNewProject4(int ano) {
		List<Item> iList = (List<Item>) sqlSession.selectList(nameSpace + "selectNewProject4", ano);
		return iList;
  }

	public List<Item> selectSuccessItem() {
		List<Item> iList = (List<Item>) sqlSession.selectList(nameSpace + "selectSuccessFundding") ;
		return iList;
	}

	public int changeBillStatus(HashMap<String, String> hmap) {
		int result = 0;
		System.out.println("secondprice : " + hmap.get("secondprice"));
		System.out.println("firstprice : " + hmap.get("firstprice"));
		if(hmap.get("secondprice") != ""){
			result += sqlSession.update(nameSpace + "changeSecondBillStatus", hmap);
		}else if(hmap.get("firstprice") != ""){
			result += sqlSession.update(nameSpace + "changeFirstBillStatus", hmap);
		}
		return result;
	}

	public List<Item> selectdefaultpast(String dDate) {
		List<Item> iList = (List<Item>) sqlSession.selectList(nameSpace + "selectdefaultpast", dDate);
		return iList;
	}

	
}

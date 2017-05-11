package com.hi.funfund.pupdate.model.service;


import java.util.List;

import com.hi.funfund.pupdate.model.vo.Pupdate;

public interface PupdateService {

	List<Pupdate> selectList(int pro_no);

	int insert(Pupdate pUpdate);

	int update(Pupdate pUpdate);

	int delete(int upno);

}

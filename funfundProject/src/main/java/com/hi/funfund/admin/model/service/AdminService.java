package com.hi.funfund.admin.model.service;

import java.util.List;

import com.hi.funfund.admin.model.vo.AccInfo;
import com.hi.funfund.admin.model.vo.CancelInfo;
import com.hi.funfund.admin.model.vo.ProfitHash;

public interface AdminService {

	List<AccInfo> selectRequestSeller();

	List<CancelInfo> selectCancelInfo();

	List<ProfitHash> totalProfit(String year);

}

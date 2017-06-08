package com.hi.funfund.admin.model.service;

import java.util.List;

import com.hi.funfund.admin.model.vo.AccInfo;
import com.hi.funfund.admin.model.vo.CancelInfo;

public interface AdminService {

	List<AccInfo> selectRequestSeller();

	List<CancelInfo> selectCancelInfo();

}

package com.hi.funfund.admin.model.vo;

import java.sql.Date;

public class CancelInfo implements java.io.Serializable{
	private int fund_no;
	private String pname;
	private String mname;
	private Date funddate;
	private int fcost;
	private String payment;
	private String evidence;
	private String id;
	public int getFund_no() {
		return fund_no;
	}
	public void setFund_no(int fund_no) {
		this.fund_no = fund_no;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public Date getFunddate() {
		return funddate;
	}
	public void setFunddate(Date funddate) {
		this.funddate = funddate;
	}
	public int getFcost() {
		return fcost;
	}
	public void setFcost(int fcost) {
		this.fcost = fcost;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getEvidence() {
		return evidence;
	}
	public void setEvidence(String evidence) {
		this.evidence = evidence;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public CancelInfo(){}
	public CancelInfo(int fund_no, String pname, String mname, Date funddate, int fcost, String payment,
			String evidence, String id) {
		super();
		this.fund_no = fund_no;
		this.pname = pname;
		this.mname = mname;
		this.funddate = funddate;
		this.fcost = fcost;
		this.payment = payment;
		this.evidence = evidence;
		this.id = id;
	}
	@Override
	public String toString() {
		return "CancelInfo [fund_no=" + fund_no + ", pname=" + pname + ", mname=" + mname + ", funddate=" + funddate
				+ ", fcost=" + fcost + ", payment=" + payment + ", evidence=" + evidence + ", id=" + id + "]";
	}
	
	
}

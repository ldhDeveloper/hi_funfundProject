package com.hi.funfund.fundlist.model.vo;

import java.sql.Date;

public class Myfunding implements java.io.Serializable {
	private int fund_no;
	private String pname;
	private String mname;
	private int mcost;
	private Date pedate;
	private String deladdress;
	private int fundcount;
	private String rephone;
	private String recname;
	private String funstatus;
	private String payment;
	private String evidence;
	private int sumcost;
	
	public Myfunding(){}

	public Myfunding(int fund_no, String pname, String mname, int mcost, Date pedate, String deladdress, int fundcount,
			String rephone, String recname, String funstatus, String payment, String evidence, int sumcost) {
		super();
		this.fund_no = fund_no;
		this.pname = pname;
		this.mname = mname;
		this.mcost = mcost;
		this.pedate = pedate;
		this.deladdress = deladdress;
		this.fundcount = fundcount;
		this.rephone = rephone;
		this.recname = recname;
		this.funstatus = funstatus;
		this.payment = payment;
		this.evidence = evidence;
		this.sumcost = sumcost;
	}

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

	public int getMcost() {
		return mcost;
	}

	public void setMcost(int mcost) {
		this.mcost = mcost;
	}

	public Date getPedate() {
		return pedate;
	}

	public void setPedate(Date pedate) {
		this.pedate = pedate;
	}

	public String getDeladdress() {
		return deladdress;
	}

	public void setDeladdress(String deladdress) {
		this.deladdress = deladdress;
	}

	public int getFundcount() {
		return fundcount;
	}

	public void setFundcount(int fundcount) {
		this.fundcount = fundcount;
	}

	public String getRephone() {
		return rephone;
	}

	public void setRephone(String rephone) {
		this.rephone = rephone;
	}

	public String getRecname() {
		return recname;
	}

	public void setRecname(String recname) {
		this.recname = recname;
	}

	public String getFunstatus() {
		return funstatus;
	}

	public void setFunstatus(String funstatus) {
		this.funstatus = funstatus;
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

	public int getSumcost() {
		return sumcost;
	}

	public void setSumcost(int sumcost) {
		this.sumcost = sumcost;
	}

	@Override
	public String toString() {
		return "Myfunding [fund_no=" + fund_no + ", pname=" + pname + ", mname=" + mname + ", mcost=" + mcost
				+ ", pedate=" + pedate + ", deladdress=" + deladdress + ", fundcount=" + fundcount + ", rephone="
				+ rephone + ", recname=" + recname + ", funstatus=" + funstatus + ", payment=" + payment + ", evidence="
				+ evidence + ", sumcost=" + sumcost + "]";
	}	
}

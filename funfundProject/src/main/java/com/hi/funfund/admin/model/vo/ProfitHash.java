package com.hi.funfund.admin.model.vo;

public class ProfitHash implements java.io.Serializable{
	private String edate;
	private int sumcost;
	
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public int getSumcost() {
		return sumcost;
	}
	public void setSumcost(int sumcost) {
		this.sumcost = sumcost;
	}
	
	public ProfitHash(){}
	public ProfitHash(String edate, int sumcost) {
		super();
		this.edate = edate;
		this.sumcost = sumcost;
	}
	@Override
	public String toString() {
		return "ProfitHash [edate=" + edate + ", sumcost=" + sumcost + "]";
	}
}

package com.hi.funfund.admin.model.vo;

public class ProfitHash implements java.io.Serializable{
	private String cname;
	private long sumcost;
	
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public long getSumcost() {
		return sumcost;
	}
	public void setSumcost(long sumcost) {
		this.sumcost = sumcost;
	}
	
	public ProfitHash(){}
	public ProfitHash(String cname, long sumcost) {
		super();
		this.cname = cname;
		this.sumcost = sumcost;
	}
	@Override
	public String toString() {
		return "ProfitHash [cname=" + cname + ", sumcost=" + sumcost + "]";
	}
}

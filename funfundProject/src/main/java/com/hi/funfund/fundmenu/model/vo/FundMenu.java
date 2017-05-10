package com.hi.funfund.fundmenu.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class FundMenu implements Serializable {

	private int mno;
	private String mname;
	private int mcost;
	private int pro_no;
	private String mcontent;
	private int addcost;
	private Date mdate;
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
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
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public String getMcontent() {
		return mcontent;
	}
	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}
	public int getAddcost() {
		return addcost;
	}
	public void setAddcost(int addcost) {
		this.addcost = addcost;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	public FundMenu() {
		super();
	}
	public FundMenu(int mno, String mname, int mcost, int pro_no, String mcontent, int addcost, Date mdate) {
		super();
		this.mno = mno;
		this.mname = mname;
		this.mcost = mcost;
		this.pro_no = pro_no;
		this.mcontent = mcontent;
		this.addcost = addcost;
		this.mdate = mdate;
	}
	@Override
	public String toString() {
		return mno + ", " + mname + ", " + mcost + ", " + pro_no + ", " + mcontent + ", " + addcost + ", " + mdate;
	}
	
	
	
}

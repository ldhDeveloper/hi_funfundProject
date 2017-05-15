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
	private int mnum;
	private int mcount;
	private String delyn;

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

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public int getMcount() {
		return mcount;
	}

	public void setMcount(int mcount) {
		this.mcount = mcount;
	}

	public String getDelyn() {
		return delyn;
	}

	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}

	public FundMenu() {
		super();
	}

	public FundMenu(int mno, String mname, int mcost, int pro_no, String mcontent, int addcost, Date mdate, int mnum,
			int mcount, String delyn) {
		super();
		this.mno = mno;
		this.mname = mname;
		this.mcost = mcost;
		this.pro_no = pro_no;
		this.mcontent = mcontent;
		this.addcost = addcost;
		this.mdate = mdate;
		this.mnum = mnum;
		this.mcount = mcount;
		this.delyn = delyn;
	}

	@Override
	public String toString() {
		return "FundMenu [mno=" + mno + ", mname=" + mname + ", mcost=" + mcost + ", pro_no=" + pro_no + ", mcontent="
				+ mcontent + ", addcost=" + addcost + ", mdate=" + mdate + ", mnum=" + mnum + ", mcount=" + mcount
				+ ", delyn=" + delyn + "]";
	}

}

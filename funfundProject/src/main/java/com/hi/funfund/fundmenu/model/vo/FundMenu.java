package com.hi.funfund.fundmenu.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class FundMenu implements Serializable {

	private int mno;
	private String mname;
	private Integer mcost;
	private int pro_no;
	private String mcontent;
	private Integer addcost;
	@DateTimeFormat(pattern = "yy/MM/dd")
	private Date mdate;
	private Integer mnum;
	private Integer mcount;
	private String delyn;
	
	public FundMenu(){}
	
	public FundMenu(int mno, String mname, Integer mcost, int pro_no, String mcontent, Integer addcost, Date mdate, Integer mnum,
			Integer mcount, String delyn) {
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

	public int getMno() {
		return mno;
	}

	public Integer getMcost() {
		return mcost;
	}


	public int getPro_no() {
		return pro_no;
	}


	public String getMcontent() {
		return mcontent;
	}




	public Integer getAddcost() {
		return addcost;
	}



	public Date getMdate() {
		return mdate;
	}


	public Integer getMnum() {
		return mnum;
	}




	public Integer getMcount() {
		return mcount;
	}




	public String getDelyn() {
		return delyn;
	}




	public void setMno(int mno) {
		this.mno = mno;
	}




	public void setMname(String mname) {
		this.mname = mname;
	}




	public void setMcost(Integer mcost) {
		this.mcost = mcost;
	}




	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}




	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}




	public void setAddcost(Integer addcost) {
		this.addcost = addcost;
	}




	public void setMdate(Date mdate) {
		this.mdate = mdate;
		this.mnum = mnum;
		this.mcount = mcount;
		this.delyn = delyn;
	}




	public void setMnum(Integer mnum) {
		this.mnum = mnum;
	}




	public void setMcount(Integer mcount) {
		this.mcount = mcount;
	}




	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}


	@Override
	public String toString() {
		return "FundMenu [mno=" + mno + ", mname=" + mname + ", mcost=" + mcost + ", pro_no=" + pro_no + ", mcontent="
				+ mcontent + ", addcost=" + addcost + ", mdate=" + mdate + ", mnum=" + mnum + ", mcount=" + mcount
				+ ", delyn=" + delyn + "]";
	}

}

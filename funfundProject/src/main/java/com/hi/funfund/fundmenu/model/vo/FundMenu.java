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
	@DateTimeFormat(pattern = "yy/MM/dd")
	private Date mdate;
	private Integer mnum;
	private Integer mcount;
	private String delyn;
	private String dcost;
	private Integer fundcount;
	private int remain;
	
	public FundMenu(){}
	
	public FundMenu(int mno, String mname, Integer mcost, int pro_no, String mcontent, Date mdate, Integer mnum,
			Integer mcount, String delyn, String dcost, Integer fundcount, int remain) {
		super();
		this.mno = mno;
		this.mname = mname;
		this.mcost = mcost;
		this.pro_no = pro_no;
		this.mcontent = mcontent;
		this.mdate = mdate;
		this.mnum = mnum;
		this.mcount = mcount;
		this.delyn = delyn;
		this.dcost = dcost;
		this.fundcount = fundcount;
		this.remain = remain;
	}
	public int getMno() {
		return mno;
	}
	public String getMname() {
		return mname;
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
	public String getDcost() {
		return dcost;
	}
	public Integer getFundcount() {
		return fundcount;
	}
	public int getRemain() {
		return remain;
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
	public void setMdate(Date mdate) {
		this.mdate = mdate;
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
	public void setDcost(String dcost) {
		this.dcost = dcost;
	}
	public void setFundcount(Integer fundcount) {
		this.fundcount = fundcount;
	}
	public void setRemain(int remain) {
		this.remain = remain;
	}
	@Override
	public String toString() {
		return "FundMenu [mno=" + mno + ", mname=" + mname + ", mcost=" + mcost + ", pro_no=" + pro_no + ", mcontent="
				+ mcontent + ", mdate=" + mdate + ", mnum=" + mnum + ", mcount=" + mcount + ", delyn=" + delyn
				+ ", dcost=" + dcost + ", fundcount=" + fundcount + ", remain=" + remain + "]";
	}
	
	


	

}

package com.hi.funfund.fundlist.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class FundList implements Serializable{
	
	private int fund_no;
	private int ano;
	private int mno;
	private String deladdress;
	private String rephone;
	private String delstatus;
	private String del_no;
	private String recname;
	private Date funddate;
	public int getFund_no() {
		return fund_no;
	}
	public void setFund_no(int fund_no) {
		this.fund_no = fund_no;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getDeladdress() {
		return deladdress;
	}
	public void setDeladdress(String deladdress) {
		this.deladdress = deladdress;
	}
	public String getRephone() {
		return rephone;
	}
	public void setRephone(String rephone) {
		this.rephone = rephone;
	}
	public String getDelstatus() {
		return delstatus;
	}
	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}
	public String getDel_no() {
		return del_no;
	}
	public void setDel_no(String del_no) {
		this.del_no = del_no;
	}
	public String getRecname() {
		return recname;
	}
	public void setRecname(String recname) {
		this.recname = recname;
	}
	public Date getFunddate() {
		return funddate;
	}
	public void setFunddate(Date funddate) {
		this.funddate = funddate;
	}
	public FundList() {
		super();
	}
	public FundList(int fund_no, int ano, int mno, String deladdress, String rephone, String delstatus, String del_no,
			String recname, Date funddate) {
		super();
		this.fund_no = fund_no;
		this.ano = ano;
		this.mno = mno;
		this.deladdress = deladdress;
		this.rephone = rephone;
		this.delstatus = delstatus;
		this.del_no = del_no;
		this.recname = recname;
		this.funddate = funddate;
	}
	@Override
	public String toString() {
		return fund_no + ", " + ano + ", " + mno + ", " + deladdress + ", " + rephone + ", " + delstatus + ", " + del_no
				+ ", " + recname + ", " + funddate;
	}
	
	
	
	

}

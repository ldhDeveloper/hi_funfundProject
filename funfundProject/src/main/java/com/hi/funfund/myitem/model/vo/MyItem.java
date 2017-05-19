package com.hi.funfund.myitem.model.vo;

import java.io.Serializable;

public class MyItem implements Serializable{

	private int mpro_no;
	private int pro_no;
	private String mptype;
	private int ano;
	public int getMpro_no() {
		return mpro_no;
	}
	public void setMpro_no(int mpro_no) {
		this.mpro_no = mpro_no;
	}
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public String getMptype() {
		return mptype;
	}
	public void setMptype(String mptype) {
		this.mptype = mptype;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	
	public MyItem(){}
	
	public MyItem(int mpro_no, int pro_no, String mptype, int ano) {
		super();
		this.mpro_no = mpro_no;
		this.pro_no = pro_no;
		this.mptype = mptype;
		this.ano = ano;
	}
	@Override
	public String toString() {
		return "MyItem [mpro_no=" + mpro_no + ", pro_no=" + pro_no + ", mptype=" + mptype + ", ano=" + ano + "]";
	}
	
	
}

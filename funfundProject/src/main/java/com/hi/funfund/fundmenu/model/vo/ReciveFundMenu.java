package com.hi.funfund.fundmenu.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.format.annotation.DateTimeFormat;

public class ReciveFundMenu {
	
	private int mno;
	private ArrayList<String> mname;
	private ArrayList<Integer> mcost;
	private int pro_no;
	private ArrayList<String> mcontent;
	@DateTimeFormat(pattern = "yy/MM/dd")
	private ArrayList<Date> mdate;
	private ArrayList<Integer> mnum;
	private ArrayList<Integer> mcount;
	private ArrayList<String> delyn;
	
	public ReciveFundMenu(){}
	
	public ReciveFundMenu(int mno, ArrayList<String> mname, ArrayList<Integer> mcost, int pro_no,
			ArrayList<String> mcontent, ArrayList<Date> mdate, ArrayList<Integer> mnum,
			ArrayList<Integer> mcount, ArrayList<String> delyn) {
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
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public ArrayList<String> getMname() {
		return mname;
	}
	public void setMname(ArrayList<String> mname) {
		this.mname = mname;
	}
	public ArrayList<Integer> getMcost() {
		return mcost;
	}
	public void setMcost(ArrayList<Integer> mcost) {
		this.mcost = mcost;
	}
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public ArrayList<String> getMcontent() {
		return mcontent;
	}
	public void setMcontent(ArrayList<String> mcontent) {
		this.mcontent = mcontent;
	}
	public ArrayList<Date> getMdate() {
		return mdate;
	}
	public void setMdate(ArrayList<Date> mdate) {
		this.mdate = mdate;
	}
	public ArrayList<Integer> getMnum() {
		return mnum;
	}
	public void setMnum(ArrayList<Integer> mnum) {
		this.mnum = mnum;
	}
	public ArrayList<Integer> getMcount() {
		return mcount;
	}
	public void setMcount(ArrayList<Integer> mcount) {
		this.mcount = mcount;
	}
	public ArrayList<String> getDelyn() {
		return delyn;
	}
	public void setDelyn(ArrayList<String> delyn) {
		this.delyn = delyn;
	}

	@Override
	public String toString() {
		return "ReciveFundMenu [mno=" + mno + ", mname=" + mname + ", mcost=" + mcost + ", pro_no=" + pro_no
				+ ", mcontent=" + mcontent  + ", mdate=" + mdate + ", mnum=" + mnum
				+ ", mcount=" + mcount + ", delyn=" + delyn + "]";
	}
	
	
	
}

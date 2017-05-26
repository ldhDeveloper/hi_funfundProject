package com.hi.funfund.fundlist.model.vo;

import java.util.ArrayList;

public class UpdateSponsor implements java.io.Serializable{
	private int pro_no;
	private ArrayList<Integer> fund_no;
	private ArrayList<String> del_no;
	
	public UpdateSponsor(){}
	
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public ArrayList<Integer> getFund_no() {
		return fund_no;
	}
	public void setFund_no(ArrayList<Integer> fund_no) {
		this.fund_no = fund_no;
	}
	public ArrayList<String> getDel_no() {
		return del_no;
	}
	public void setDel_no(ArrayList<String> del_no) {
		this.del_no = del_no;
	}

	@Override
	public String toString() {
		return "UpdateSponsor [pro_no=" + pro_no + ", fund_no=" + fund_no + ", del_no=" + del_no + "]";
	}
	
}

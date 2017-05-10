package com.hi.funfund.pupdate.model.vo;

import java.io.Serializable;

public class Pupdate implements Serializable {

	 private int upno;
	private int pro_no;
	private String uptitle;
	private String upname;
	public int getUpno() {
		return upno;
	}
	public void setUpno(int upno) {
		this.upno = upno;
	}
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public String getUptitle() {
		return uptitle;
	}
	public void setUptitle(String uptitle) {
		this.uptitle = uptitle;
	}
	public String getUpname() {
		return upname;
	}
	public void setUpname(String upname) {
		this.upname = upname;
	}
	public Pupdate() {
		super();
	}
	public Pupdate(int upno, int pro_no, String uptitle, String upname) {
		super();
		this.upno = upno;
		this.pro_no = pro_no;
		this.uptitle = uptitle;
		this.upname = upname;
	}
	@Override
	public String toString() {
		return upno + ", " + pro_no + ", " + uptitle + ", " + upname;
	}
	
	
	
}

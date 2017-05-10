package com.hi.funfund.notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Notice implements Serializable {

	public Notice(){};
	
	private int nno;
	private int bno;
	private String ntitle;
	private String ncontent;
	private Date ndate;
	private int upbno;
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public Date getNdate() {
		return ndate;
	}
	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}
	public int getUpbno() {
		return upbno;
	}
	public void setUpbno(int upbno) {
		this.upbno = upbno;
	}

	public Notice(int nno, int bno, String ntitle, String ncontent, Date ndate, int upbno) {
		super();
		this.nno = nno;
		this.bno = bno;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.ndate = ndate;
		this.upbno = upbno;
	}
	@Override
	public String toString() {
		return nno + ", " + bno + ", " + ntitle + ", " + ncontent + ", " + ndate + ", " + upbno;
	}
	
	
}

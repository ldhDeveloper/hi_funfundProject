package com.hi.funfund.notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Notice implements Serializable {

	public Notice(){};
	
	private int nno;
	private String ntitle;
	private String ncontent;
	private Date ndate;
	private int upbno;
	private String bname;
	private String nickname;
	private int readcount;
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
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
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
	
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Notice(int nno, String ntitle, String ncontent, Date ndate, int upbno, String bname, String nickname,
			int readcount) {
		super();
		this.nno = nno;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.ndate = ndate;
		this.upbno = upbno;
		this.bname = bname;
		this.nickname = nickname;
		this.readcount = readcount;
	}
	@Override
	public String toString() {
		return nno + ", " + ntitle + ", " + ncontent + ", " + ndate + ", " + upbno + ", " + bname + ", " + nickname
				+ ", " + readcount;
	}
	
	
	
}

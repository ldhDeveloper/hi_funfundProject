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
	private String bname;
	private String nickname;
	private int readcount;
	private int ano;
	private String pimage;
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
	
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public Notice(int nno, int bno, String ntitle, String ncontent, Date ndate, int upbno, String bname,
			String nickname, int readcount, int ano, String pimage) {
		super();
		this.nno = nno;
		this.bno = bno;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.ndate = ndate;
		this.upbno = upbno;
		this.bname = bname;
		this.nickname = nickname;
		this.readcount = readcount;
		this.ano = ano;
		this.pimage = pimage;
	}
	@Override
	public String toString() {
		return nno + ", " + bno + ", " + ntitle + ", " + ncontent + ", " + ndate + ", " + upbno + ", " + bname + ", "
				+ nickname + ", " + readcount + ", " + ano + ", " + pimage;
	}
	
	
	
	
	
}

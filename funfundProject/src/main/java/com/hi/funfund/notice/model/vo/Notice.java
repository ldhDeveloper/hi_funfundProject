package com.hi.funfund.notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Notice implements Serializable {

	public Notice(){};
	
	private int nno;
	private String ntitle;
	private String ncontent;
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date ndate;
	private int upbno;
	private String bname;
	private String nickname;
	private int readcount;
	private int ano;
	private String pimage;
	private int nreply_lev;
	private int replybno;
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
	public int getNreply_lev() {
		return nreply_lev;
	}
	public void setNreply_lev(int nreply_lev) {
		this.nreply_lev = nreply_lev;
	}
	public int getReplybno() {
		return replybno;
	}
	public void setReplybno(int replybno) {
		this.replybno = replybno;
	}
	public Notice(int nno,  String ntitle, String ncontent, Date ndate, int upbno, String bname,
			String nickname, int readcount, int ano, String pimage, int nreply_lev, int replybno) {
		super();
		this.nno = nno;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.ndate = ndate;
		this.upbno = upbno;
		this.bname = bname;
		this.nickname = nickname;
		this.readcount = readcount;
		this.ano = ano;
		this.pimage = pimage;
		this.nreply_lev=nreply_lev;
		this.replybno = replybno;
	}
	@Override
	public String toString() {
		return "Notice [nno=" + nno + ", ntitle=" + ntitle + ", ncontent=" + ncontent + ", ndate=" + ndate + ", upbno="
				+ upbno + ", bname=" + bname + ", nickname=" + nickname + ", readcount=" + readcount + ", ano=" + ano
				+ ", pimage=" + pimage + ", nreply_lev=" + nreply_lev + ", replybno=" + replybno + "]";
	}
	
	
	
	
	
	
	
	
}

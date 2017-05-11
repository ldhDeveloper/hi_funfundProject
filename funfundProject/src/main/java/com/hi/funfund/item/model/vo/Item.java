package com.hi.funfund.item.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Item implements Serializable {

	public Item(){};
	
	private int pro_no;
	private int ano;
	private String pname;
	private String pcontent;
	private String category;
	private Date psdate;
	private Date pedate;
	private String pshort;
	private int ecost;
	private String refund;
	private String pvideo;
	private String pstatus;
	private int likecount;
	private String sharelink;
	
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getPsdate() {
		return psdate;
	}
	public void setPsdate(Date psdate) {
		this.psdate = psdate;
	}
	public Date getPedate() {
		return pedate;
	}
	public void setPedate(Date pedate) {
		this.pedate = pedate;
	}
	public String getPshort() {
		return pshort;
	}
	public void setPshort(String pshort) {
		this.pshort = pshort;
	}
	public int getEcost() {
		return ecost;
	}
	public void setEcost(int ecost) {
		this.ecost = ecost;
	}
	public String getRefund() {
		return refund;
	}
	public void setRefund(String refund) {
		this.refund = refund;
	}
	public String getPvideo() {
		return pvideo;
	}
	public void setPvideo(String pvideo) {
		this.pvideo = pvideo;
	}
	public String getPstatus() {
		return pstatus;
	}
	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	public String getSharelink() {
		return sharelink;
	}
	public void setSharelink(String sharelink) {
		this.sharelink = sharelink;
	}
	
	
	
	public Item(int pro_no, int ano, String pname, String pcontent, String category, Date psdate, Date pedate,
			String pshort, int ecost, String refund, String pvideo, String pstatus, int likecount, String sharelink) {
		super();
		this.pro_no = pro_no;
		this.ano = ano;
		this.pname = pname;
		this.pcontent = pcontent;
		this.category = category;
		this.psdate = psdate;
		this.pedate = pedate;
		this.pshort = pshort;
		this.ecost = ecost;
		this.refund = refund;
		this.pvideo = pvideo;
		this.pstatus = pstatus;
		this.likecount = likecount;
		this.sharelink = sharelink;
	}
	@Override
	public String toString() {
		return pro_no + ", " + ano + ", " + pname + ", " + pcontent + ", " + category + ", " + psdate + ", " + pedate
				+ ", " + pshort + ", " + ecost + ", " + refund + ", " + pvideo + ", " + pstatus + ", " + likecount
				+ ", " + sharelink;
	}
	
	
}

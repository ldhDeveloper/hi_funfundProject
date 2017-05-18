package com.hi.funfund.item.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Item implements Serializable {

	public Item() {
	};

	private int pro_no;
	private int ano;
	private String pname;
	private String pcontent;
	private String category;
	@DateTimeFormat(pattern = "yy/MM/dd")
	private Date psdate;
	@DateTimeFormat(pattern = "yy/MM/dd")
	private Date pedate;
	private String pshort;
	private Integer ecost;
	private String refund;
	private String pvideo;
	private String pstatus;
	private int likecount;
	private String sharelink;
	private String bankcode;
	private String accpnm;
	private String accnum;
	private String cname;
	private String cs_email;
	private String cs_phone;
	private int fundamount;
	private int fundcount;
	private int supportcount;
	private int upcount;
	private int repcount;
	
	
	
	

	public int getUpcount() {
		return upcount;
	}

	public void setUpcount(int upcount) {
		this.upcount = upcount;
	}

	public int getRepcount() {
		return repcount;
	}

	public void setRepcount(int repcount) {
		this.repcount = repcount;
	}

	public int getFundamount() {
		return fundamount;
	}

	public void setFundamount(int fundamount) {
		this.fundamount = fundamount;
	}

	public int getFundcount() {
		return fundcount;
	}

	public void setFundcount(int fundcount) {
		this.fundcount = fundcount;
	}

	public int getSupportcount() {
		return supportcount;
	}

	public void setSupportcount(int supportcount) {
		this.supportcount = supportcount;
	}

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

	public Integer getEcost() {
		return ecost;
	}

	public void setEcost(Integer ecost) {
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

	public String getBankcode() {
		return bankcode;
	}

	public void setBankcode(String bankcode) {
		this.bankcode = bankcode;
	}

	public String getAccpnm() {
		return accpnm;
	}

	public void setAccpnm(String accpnm) {
		this.accpnm = accpnm;
	}

	public String getAccnum() {
		return accnum;
	}

	public void setAccnum(String accnum) {
		this.accnum = accnum;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCs_email() {
		return cs_email;
	}

	public void setCs_email(String cs_email) {
		this.cs_email = cs_email;
	}

	public String getCs_phone() {
		return cs_phone;
	}

	public void setCs_phone(String cs_phone) {
		this.cs_phone = cs_phone;
	}

	public Item(int pro_no, int ano, String pname, String pcontent, String category, Date psdate, Date pedate,
			String pshort, Integer ecost, String refund, String pvideo, String pstatus, int likecount, String sharelink,
			String bankcode, String accpnm, String accnum, String cname, String cs_email, String cs_phone,
			int fundamount, int fundcount, int supportcount, int upcount, int repcount) {
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
		this.bankcode = bankcode;
		this.accpnm = accpnm;
		this.accnum = accnum;
		this.cname = cname;
		this.cs_email = cs_email;
		this.cs_phone = cs_phone;
		this.fundamount = fundamount;
		this.fundcount = fundcount;
		this.supportcount = supportcount;
		this.upcount = upcount;
		this.repcount = repcount;
	}

	@Override
	public String toString() {
		return "Item [pro_no=" + pro_no + ", ano=" + ano + ", pname=" + pname + ", pcontent=" + pcontent + ", category="
				+ category + ", psdate=" + psdate + ", pedate=" + pedate + ", pshort=" + pshort + ", ecost=" + ecost
				+ ", refund=" + refund + ", pvideo=" + pvideo + ", pstatus=" + pstatus + ", likecount=" + likecount
				+ ", sharelink=" + sharelink + ", bankcode=" + bankcode + ", accpnm=" + accpnm + ", accnum=" + accnum
				+ ", cname=" + cname + ", cs_email=" + cs_email + ", cs_phone=" + cs_phone + ", fundamount="
				+ fundamount + ", fundcount=" + fundcount + ", supportcount=" + supportcount + ", upcount=" + upcount
				+ ", repcount=" + repcount + "]";
	}

	

}

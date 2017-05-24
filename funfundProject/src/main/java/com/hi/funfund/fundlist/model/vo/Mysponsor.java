package com.hi.funfund.fundlist.model.vo;

import java.sql.Date;

public class Mysponsor implements java.io.Serializable{
	private int fund_no;
	private int ano;
	private int mno;
	private String deladdress;
	private String rephone;
	private String delstatus;
	private String del_no;
	private String recname;
	private Date funddate;
	private String funstatus;
	private int addcost;
	private int fundcount;
	private String payment;
	private String evidence;
	private String mname;
	private int mcost;
	private String nickname;
	private int tcost;
	private String email;
	
	public Mysponsor(){}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getTcost() {
		return tcost;
	}
	public void setTcost(int tcost) {
		this.tcost = tcost;
	}
	public int getFund_no() {
		return fund_no;
	}
	public void setFund_no(int fund_no) {
		this.fund_no = fund_no;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getDeladdress() {
		return deladdress;
	}
	public void setDeladdress(String deladdress) {
		this.deladdress = deladdress;
	}
	public String getRephone() {
		return rephone;
	}
	public void setRephone(String rephone) {
		this.rephone = rephone;
	}
	public String getDelstatus() {
		return delstatus;
	}
	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}
	public String getDel_no() {
		return del_no;
	}
	public void setDel_no(String del_no) {
		this.del_no = del_no;
	}
	public String getRecname() {
		return recname;
	}
	public void setRecname(String recname) {
		this.recname = recname;
	}
	public Date getFunddate() {
		return funddate;
	}
	public void setFunddate(Date funddate) {
		this.funddate = funddate;
	}
	public String getFunstatus() {
		return funstatus;
	}
	public void setFunstatus(String funstatus) {
		this.funstatus = funstatus;
	}
	public int getAddcost() {
		return addcost;
	}
	public void setAddcost(int addcost) {
		this.addcost = addcost;
	}
	public int getFundcount() {
		return fundcount;
	}
	public void setFundcount(int fundcount) {
		this.fundcount = fundcount;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getEvidence() {
		return evidence;
	}
	public void setEvidence(String evidence) {
		this.evidence = evidence;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getMcost() {
		return mcost;
	}
	public void setMcost(int mcost) {
		this.mcost = mcost;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Mysponsor(int fund_no, int ano, int mno, String deladdress, String rephone, String delstatus, String del_no,
			String recname, Date funddate, String funstatus, int addcost, int fundcount, String payment,
			String evidence, String mname, int mcost, String nickname, int tcost, String email) {
		super();
		this.fund_no = fund_no;
		this.ano = ano;
		this.mno = mno;
		this.deladdress = deladdress;
		this.rephone = rephone;
		this.delstatus = delstatus;
		this.del_no = del_no;
		this.recname = recname;
		this.funddate = funddate;
		this.funstatus = funstatus;
		this.addcost = addcost;
		this.fundcount = fundcount;
		this.payment = payment;
		this.evidence = evidence;
		this.mname = mname;
		this.mcost = mcost;
		this.nickname = nickname;
		this.tcost = tcost;
		this.email = email;
	}
	@Override
	public String toString() {
		return "Mysponsor [fund_no=" + fund_no + ", ano=" + ano + ", mno=" + mno + ", deladdress=" + deladdress
				+ ", rephone=" + rephone + ", delstatus=" + delstatus + ", del_no=" + del_no + ", recname=" + recname
				+ ", funddate=" + funddate + ", funstatus=" + funstatus + ", addcost=" + addcost + ", fundcount="
				+ fundcount + ", payment=" + payment + ", evidence=" + evidence + ", mname=" + mname + ", mcost="
				+ mcost + ", nickname=" + nickname + ", tcost=" + tcost + ", email=" + email + "]";
	}
	

}

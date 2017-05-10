package com.hi.funfund.account.model.vo;

public class Party implements java.io.Serializable {
	private int pno;
	private int ano;
	private String pname;
	private String phone;
	private String intro;
	private String account;
	private String cname;
	private String id_no;
	private String com_no;
	private String president;
	private String address;
	private boolean pconfirm;
	private boolean econfirm;
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getId_no() {
		return id_no;
	}
	public void setId_no(String id_no) {
		this.id_no = id_no;
	}
	public String getCom_no() {
		return com_no;
	}
	public void setCom_no(String com_no) {
		this.com_no = com_no;
	}
	public String getPresident() {
		return president;
	}
	public void setPresident(String president) {
		this.president = president;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public boolean isPconfirm() {
		return pconfirm;
	}
	public void setPconfirm(boolean pconfirm) {
		this.pconfirm = pconfirm;
	}
	public boolean isEconfirm() {
		return econfirm;
	}
	public void setEconfirm(boolean econfirm) {
		this.econfirm = econfirm;
	}
	
	public Party(){}
	public Party(int pno, int ano, String pname, String phone, String intro, String account, String cname, String id_no,
			String com_no, String president, String address, boolean pconfirm, boolean econfirm) {
		super();
		this.pno = pno;
		this.ano = ano;
		this.pname = pname;
		this.phone = phone;
		this.intro = intro;
		this.account = account;
		this.cname = cname;
		this.id_no = id_no;
		this.com_no = com_no;
		this.president = president;
		this.address = address;
		this.pconfirm = pconfirm;
		this.econfirm = econfirm;
	}
	@Override
	public String toString() {
		return "Party [pno=" + pno + ", ano=" + ano + ", pname=" + pname + ", phone=" + phone + ", intro=" + intro
				+ ", account=" + account + ", cname=" + cname + ", id_no=" + id_no + ", com_no=" + com_no
				+ ", president=" + president + ", address=" + address + ", pconfirm=" + pconfirm + ", econfirm="
				+ econfirm + "]";
	}
	
	
	
}

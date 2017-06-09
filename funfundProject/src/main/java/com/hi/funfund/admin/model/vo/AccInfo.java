package com.hi.funfund.admin.model.vo;

public class AccInfo implements java.io.Serializable{
	private int ano;
	private String pname;
	private String id_no;
	private String id;
	private String idtype;
	private String phone;
	private String idimage;
	
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getId_no() {
		return id_no;
	}
	public void setId_no(String id_no) {
		this.id_no = id_no;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIdtype() {
		return idtype;
	}
	public void setIdtype(String idtype) {
		this.idtype = idtype;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getIdimage() {
		return idimage;
	}
	public void setIdimage(String idimage) {
		this.idimage = idimage;
	}
	public AccInfo(){}
	public AccInfo(int ano, String pname, String id_no, String id, String idtype, String phone, String idimage) {
		super();
		this.ano = ano;
		this.pname = pname;
		this.id_no = id_no;
		this.id = id;
		this.idtype = idtype;
		this.phone = phone;
		this.idimage = idimage;
	}
	@Override
	public String toString() {
		return "AccInfo [ano=" + ano + ", pname=" + pname + ", id_no=" + id_no + ", id=" + id + ", idtype=" + idtype
				+ ", phone=" + phone + ", idimage=" + idimage + "]";
	}
	

}

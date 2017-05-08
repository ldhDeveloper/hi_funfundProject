package com.hi.funfund.attachment.model.vo;

import java.io.Serializable;

public class Attachment implements Serializable {

	private int fno;
	private String orifname;
	private String refname;
	private String ftype;
	private int refno;
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getOrifname() {
		return orifname;
	}
	public void setOrifname(String orifname) {
		this.orifname = orifname;
	}
	public String getRefname() {
		return refname;
	}
	public void setRefname(String refname) {
		this.refname = refname;
	}
	public String getFtype() {
		return ftype;
	}
	public void setFtype(String ftype) {
		this.ftype = ftype;
	}
	public int getRefno() {
		return refno;
	}
	public void setRefno(int refno) {
		this.refno = refno;
	}
	
	
	public Attachment() {
		super();
	}
	public Attachment(int fno, String orifname, String refname, String ftype, int refno) {
		super();
		this.fno = fno;
		this.orifname = orifname;
		this.refname = refname;
		this.ftype = ftype;
		this.refno = refno;
	}
	@Override
	public String toString() {
		return fno + ", " + orifname + ", " + refname + ", " + ftype + ", " + refno;
	}
	
	
}

package com.hi.funfund.attachment.model.vo;

import java.io.Serializable;

public class Attachment implements Serializable {

	private int fno;
	private String orifname;
	private String refname;
	private String ftype;
	private String fsubtype;
	private int fnum;
	private int refno;
	
	public int getFnum() {
		return fnum;
	}
	public void setFnum(int fnum) {
		this.fnum = fnum;
	}
	public String getFsubtype() {
		return fsubtype;
	}
	public void setFsubtype(String fsubtype) {
		this.fsubtype = fsubtype;
	}
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
	public Attachment(int fno, String orifname, String refname, String ftype, String fsubtype, int fnum, int refno) {
		super();
		this.fno = fno;
		this.orifname = orifname;
		this.refname = refname;
		this.ftype = ftype;
		this.fsubtype = fsubtype;
		this.fnum = fnum;
		this.refno = refno;
	}
	
	@Override
	public String toString() {
		return "Attachment [fno=" + fno + ", orifname=" + orifname + ", refname=" + refname + ", ftype=" + ftype
				+ ", fsubtype=" + fsubtype + ", fnum=" + fnum + ", refno=" + refno + "]";
	}
}

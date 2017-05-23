package com.hi.funfund.attachment.model.vo;

import java.io.Serializable;

public class Attachment implements Serializable {

	private Integer fno;
	private String orifname;
	private String refname;
	private String ftype;
	private String fsubtype;
	private Integer fnum;
	private Integer refno;
	

	public Attachment() {
		super();
	}
	public Attachment(Integer fno, String orifname, String refname, String ftype, String fsubtype, Integer fnum,
			Integer refno) {
		super();
		this.fno = fno;
		this.orifname = orifname;
		this.refname = refname;
		this.ftype = ftype;
		this.fsubtype = fsubtype;
		this.fnum = fnum;
		this.refno = refno;
	}

	public Integer getFno() {
		return fno;
	}

	public void setFno(Integer fno) {
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

	public String getFsubtype() {
		return fsubtype;
	}

	public void setFsubtype(String fsubtype) {
		this.fsubtype = fsubtype;
	}

	public Integer getFnum() {
		return fnum;
	}

	public void setFnum(Integer fnum) {
		this.fnum = fnum;
	}

	public Integer getRefno() {
		return refno;
	}

	public void setRefno(Integer refno) {
		this.refno = refno;
	}

	@Override
	public String toString() {
		return "Attachment [fno=" + fno + ", orifname=" + orifname + ", refname=" + refname + ", ftype=" + ftype
				+ ", fsubtype=" + fsubtype + ", fnum=" + fnum + ", refno=" + refno + "]";
	}
}

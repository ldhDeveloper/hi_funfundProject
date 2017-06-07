package com.hi.funfund.alert.model.vo;

import java.sql.Date;

public class Alert {
	private int al_no;
	private String al_title;
	private String al_content;
	private Date al_date;
	private String s_al_date;
	private String readyn;
	private int ano;
	
	public Alert(){}

	public Alert(int al_no, String al_title, String al_content, Date al_date, String s_al_date, String readyn,
			int ano) {
		super();
		this.al_no = al_no;
		this.al_title = al_title;
		this.al_content = al_content;
		this.al_date = al_date;
		this.s_al_date = s_al_date;
		this.readyn = readyn;
		this.ano = ano;
	}

	public int getAl_no() {
		return al_no;
	}

	public void setAl_no(int al_no) {
		this.al_no = al_no;
	}

	public String getAl_title() {
		return al_title;
	}

	public void setAl_title(String al_title) {
		this.al_title = al_title;
	}

	public String getAl_content() {
		return al_content;
	}

	public void setAl_content(String al_content) {
		this.al_content = al_content;
	}

	public Date getAl_date() {
		return al_date;
	}

	public void setAl_date(Date al_date) {
		this.al_date = al_date;
	}

	public String getS_al_date() {
		return s_al_date;
	}

	public void setS_al_date(String s_al_date) {
		this.s_al_date = s_al_date;
	}

	public String getReadyn() {
		return readyn;
	}

	public void setReadyn(String readyn) {
		this.readyn = readyn;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	@Override
	public String toString() {
		return "Alert [al_no=" + al_no + ", al_title=" + al_title + ", al_content=" + al_content + ", al_date="
				+ al_date + ", s_al_date=" + s_al_date + ", readyn=" + readyn + ", ano=" + ano + "]";
	}

	
	

}

package com.hi.funfund.itemask.model.vo;

import java.sql.Date;

public class ItemAsk {

	private int ask_no;
	private int pro_no;
	private String ask_type;
	private String ask_content;
	private int id_no;
	private Date ask_date;
	public int getAsk_no() {
		return ask_no;
	}
	public void setAsk_no(int ask_no) {
		this.ask_no = ask_no;
	}
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public String getAsk_type() {
		return ask_type;
	}
	public void setAsk_type(String ask_type) {
		this.ask_type = ask_type;
	}
	public String getAsk_content() {
		return ask_content;
	}
	public void setAsk_content(String ask_content) {
		this.ask_content = ask_content;
	}
	public int getId_no() {
		return id_no;
	}
	public void setId_no(int id_no) {
		this.id_no = id_no;
	}
	public Date getAsk_date() {
		return ask_date;
	}
	public void setAsk_date(Date ask_date) {
		this.ask_date = ask_date;
	}
	public ItemAsk() {
		super();
	}
	public ItemAsk(int ask_no, int pro_no, String ask_type, String ask_content, int id_no, Date ask_date) {
		super();
		this.ask_no = ask_no;
		this.pro_no = pro_no;
		this.ask_type = ask_type;
		this.ask_content = ask_content;
		this.id_no = id_no;
		this.ask_date = ask_date;
	}
	@Override
	public String toString() {
		return ask_no + ", " + pro_no + ", " + ask_type + ", " + ask_content + ", " + id_no + ", " + ask_date;
	}
	
	
	
}

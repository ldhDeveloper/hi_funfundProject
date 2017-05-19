package com.hi.funfund.item.model.vo;

public class Itemfund {
	private int pro_no;
	private String nickname;
	private int mcost;

	public Itemfund() {
		super();
	}

	public Itemfund(int pro_no, String nickname, int mcost) {
		super();
		this.pro_no = pro_no;
		this.nickname = nickname;
		this.mcost = mcost;
	}

	public int getPro_no() {
		return pro_no;
	}

	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getMcost() {
		return mcost;
	}

	public void setMcost(int mcost) {
		this.mcost = mcost;
	}

	@Override
	public String toString() {
		return "Itemfund [pro_no=" + pro_no + ", nickname=" + nickname + ", mcost=" + mcost + "]";
	}

}

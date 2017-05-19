package com.hi.funfund.item.model.vo;

public class Itemfund {
	private int pro_no;
	private String nickname;
	private int mcost;
	private String pimage;

	public Itemfund() {
		super();
	}

	public Itemfund(int pro_no, String nickname, int mcost, String pimage) {
		super();
		this.pro_no = pro_no;
		this.nickname = nickname;
		this.mcost = mcost;
		this.pimage = pimage;
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

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	@Override
	public String toString() {
		return "Itemfund [pro_no=" + pro_no + ", nickname=" + nickname + ", mcost=" + mcost + ", pimage=" + pimage
				+ "]";
	}

	

}

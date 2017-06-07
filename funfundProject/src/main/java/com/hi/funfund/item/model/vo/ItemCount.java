package com.hi.funfund.item.model.vo;

public class ItemCount {
	private Integer itemcount;
	private Integer totalprice;
	private Double sucrate;
	
	public ItemCount(){}

	public ItemCount(Integer itemcount, Integer totalprice, Double sucrate) {
		super();
		this.itemcount = itemcount;
		this.totalprice = totalprice;
		this.sucrate = sucrate;
	}

	public Integer getItemcount() {
		return itemcount;
	}

	public Integer getTotalprice() {
		return totalprice;
	}

	public Double getSucrate() {
		return sucrate;
	}

	public void setItemcount(Integer itemcount) {
		this.itemcount = itemcount;
	}

	public void setTotalprice(Integer totalprice) {
		this.totalprice = totalprice;
	}

	public void setSucrate(Double sucrate) {
		this.sucrate = sucrate;
	}

	@Override
	public String toString() {
		return "ItemCount [itemcount=" + itemcount + ", totalprice=" + totalprice + ", sucrate=" + sucrate + "]";
	}
	
	
}

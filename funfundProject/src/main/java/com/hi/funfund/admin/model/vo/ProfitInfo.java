package com.hi.funfund.admin.model.vo;

public class ProfitInfo implements java.io.Serializable{
	private long jan;
	private long feb;
	private long mar;
	private long apr;
	private long may;
	private long jun;
	private long jul;
	private long aug;
	private long sep;
	private long oct;
	private long nov;
	private long dec;
	
	public long getJan() {
		return jan;
	}
	public void setJan(long jan) {
		this.jan = jan;
	}
	public long getFeb() {
		return feb;
	}
	public void setFeb(long feb) {
		this.feb = feb;
	}
	public long getMar() {
		return mar;
	}
	public void setMar(long mar) {
		this.mar = mar;
	}
	public long getApr() {
		return apr;
	}
	public void setApr(long apr) {
		this.apr = apr;
	}
	public long getMay() {
		return may;
	}
	public void setMay(long may) {
		this.may = may;
	}
	public long getJun() {
		return jun;
	}
	public void setJun(long jun) {
		this.jun = jun;
	}
	public long getJul() {
		return jul;
	}
	public void setJul(long jul) {
		this.jul = jul;
	}
	public long getAug() {
		return aug;
	}
	public void setAug(long aug) {
		this.aug = aug;
	}
	public long getSep() {
		return sep;
	}
	public void setSep(long sep) {
		this.sep = sep;
	}	
	public long getOct() {
		return oct;
	}
	public void setOct(long oct) {
		this.oct = oct;
	}
	public long getNov() {
		return nov;
	}
	public void setNov(long nov) {
		this.nov = nov;
	}
	public long getDec() {
		return dec;
	}
	public void setDec(long dec) {
		this.dec = dec;
	}
	public ProfitInfo(){}
	public ProfitInfo(long jan, long feb, long mar, long apr, long may, long jun, long jul, long aug, long sep, long oct, long nov,
			long dec) {
		super();
		this.jan = jan;
		this.feb = feb;
		this.mar = mar;
		this.apr = apr;
		this.may = may;
		this.jun = jun;
		this.jul = jul;
		this.aug = aug;
		this.sep = sep;
		this.oct = oct;
		this.nov = nov;
		this.dec = dec;
	}
	@Override
	public String toString() {
		return "ProfitInfo [jan=" + jan + ", feb=" + feb + ", mar=" + mar + ", apr=" + apr + ", may=" + may + ", jun="
				+ jun + ", jul=" + jul + ", aug=" + aug + ", sep=" + sep + ", oct=" + oct + ", nov=" + nov + ", dec="
				+ dec + "]";
	}
	
}

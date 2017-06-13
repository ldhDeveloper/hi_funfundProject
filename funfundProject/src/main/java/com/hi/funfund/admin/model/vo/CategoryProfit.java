package com.hi.funfund.admin.model.vo;

public class CategoryProfit implements java.io.Serializable{
	private long tech;
	private long beauty;
	private long food;
	private long design;
	private long art;
	private long game;
	private long trip;
	private long sport;
	private long pinterest;
	public long getTech() {
		return tech;
	}
	public void setTech(long tech) {
		this.tech = tech;
	}
	public long getBeauty() {
		return beauty;
	}
	public void setBeauty(long beauty) {
		this.beauty = beauty;
	}
	public long getFood() {
		return food;
	}
	public void setFood(long food) {
		this.food = food;
	}
	public long getDesign() {
		return design;
	}
	public void setDesign(long design) {
		this.design = design;
	}
	public long getArt() {
		return art;
	}
	public void setArt(long art) {
		this.art = art;
	}
	public long getGame() {
		return game;
	}
	public void setGame(long game) {
		this.game = game;
	}
	public long getTrip() {
		return trip;
	}
	public void setTrip(long trip) {
		this.trip = trip;
	}
	public long getSport() {
		return sport;
	}
	public void setSport(long sport) {
		this.sport = sport;
	}
	public long getPinterest() {
		return pinterest;
	}
	public void setPinterest(long pinterest) {
		this.pinterest = pinterest;
	}
	public CategoryProfit(){}
	public CategoryProfit(long tech, long beauty, long food, long design, long art, long game, long trip, long sport,
			long pinterest) {
		super();
		this.tech = tech;
		this.beauty = beauty;
		this.food = food;
		this.design = design;
		this.art = art;
		this.game = game;
		this.trip = trip;
		this.sport = sport;
		this.pinterest = pinterest;
	}
	@Override
	public String toString() {
		return "CategoryProfit [tech=" + tech + ", beauty=" + beauty + ", food=" + food + ", design=" + design
				+ ", art=" + art + ", game=" + game + ", trip=" + trip + ", sport=" + sport + ", pinterest=" + pinterest
				+ "]";
	}
}

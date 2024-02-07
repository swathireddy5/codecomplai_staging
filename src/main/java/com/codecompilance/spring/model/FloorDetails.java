package com.codecompilance.spring.model;

import java.util.List;

public class FloorDetails {
	private String floor;
	private String storyHeight;
	private List<BuildingComposition> bList;
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getStoryHeight() {
		return storyHeight;
	}
	public void setStoryHeight(String storyHeight) {
		this.storyHeight = storyHeight;
	}
	public List<BuildingComposition> getbList() {
		return bList;
	}
	public void setbList(List<BuildingComposition> bList) {
		this.bList = bList;
	}
}

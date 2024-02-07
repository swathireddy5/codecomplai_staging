package com.codecompilance.spring.model;

import java.util.List;

public class SubChp {
	private int subChapterId;
	private String subChpName;
	private String subChpTitle;
	private List<SubChpSec> subChpSecList;
	private String subChpContent;
	
	public int getSubChapterId() {
		return subChapterId;
	}

	public void setSubChapterId(int subChapterId) {
		this.subChapterId = subChapterId;
	}
	
	public String getSubChpName() {
		return subChpName;
	}
	public void setSubChpName(String subChpName) {
		this.subChpName = subChpName;
	}
	public String getSubChpContent() {
		return subChpContent;
	}
	public void setSubChpContent(String subChpContent) {
		this.subChpContent = subChpContent;
	}
	
	public String getSubChpTitle() {
		return subChpTitle;
	}
	
	public void setSubChpTitle(String subChpTitle) {
		this.subChpTitle = subChpTitle;
	}
	
	public List<SubChpSec> getSubChpSecList() {
		return subChpSecList;
	}
	public void setSubChpSecList(List<SubChpSec> subChpSecList) {
		this.subChpSecList = subChpSecList;
	}
	

}

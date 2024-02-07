package com.codecompilance.spring.model;

import java.util.List;

public class SubChpSec {
	private int subChapterSecId;
	private int subChapterId;
	private String subChpSecName;
	private String subChapterSecTitle;
	private String subChapterSecContent;
	private List<SubChapterSecSubSec> subChapterSecSubSecList;
	
	
	public int getSubChapterSecId() {
		return subChapterSecId;
	}
	public void setSubChapterSecId(int subChapterSecId) {
		this.subChapterSecId = subChapterSecId;
	}
	public int getSubChapterId() {
		return subChapterId;
	}
	public void setSubChapterId(int subChapterId) {
		this.subChapterId = subChapterId;
	}
	public String getSubChapterSecContent() {
		return subChapterSecContent;
	}
	public void setSubChapterSecContent(String subChapterSecContent) {
		this.subChapterSecContent = subChapterSecContent;
	}
	public String getSubChpSecName() {
		return subChpSecName;
	}
	public void setSubChpSecName(String subChpSecName) {
		this.subChpSecName = subChpSecName;
	}
	
	public String getSubChapterSecTitle() {
		return subChapterSecTitle;
	}
	public void setSubChapterSecTitle(String subChapterSecTitle) {
		this.subChapterSecTitle = subChapterSecTitle;
	}
	public List<SubChapterSecSubSec> getSubChapterSecSubSecList() {
		return subChapterSecSubSecList;
	}
	public void setSubChapterSecSubSecList(List<SubChapterSecSubSec> subChapterSecSubSecList) {
		this.subChapterSecSubSecList = subChapterSecSubSecList;
	}
	

}

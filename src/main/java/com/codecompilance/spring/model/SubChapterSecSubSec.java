package com.codecompilance.spring.model;

import java.util.List;

public class SubChapterSecSubSec {
	private String subChapterSecSubSecName;
	private String subChapterSecSubSecTitle;
	private String subChapterSecSubSecContent;
	private String subChapterSecSubSecId;
	private List<SubChapterSecSubSubSec> subChapterSecSubSubSecList;
	
	
	public String getSubChapterSecSubSecId() {
		return subChapterSecSubSecId;
	}
	public void setSubChapterSecSubSecId(String subChapterSecSubSecId) {
		this.subChapterSecSubSecId = subChapterSecSubSecId;
	}
	public String getSubChapterSecSubSecName() {
		return subChapterSecSubSecName;
	}
	public void setSubChapterSecSubSecName(String subChapterSecSubSecName) {
		this.subChapterSecSubSecName = subChapterSecSubSecName;
	}
	public String getSubChapterSecSubSecTitle() {
		return subChapterSecSubSecTitle;
	}
	public void setSubChapterSecSubSecTitle(String subChapterSecSubSecTitle) {
		this.subChapterSecSubSecTitle = subChapterSecSubSecTitle;
	}
	public String getSubChapterSecSubSecContent() {
		return subChapterSecSubSecContent;
	}
	public void setSubChapterSecSubSecContent(String subChapterSecSubSecContent) {
		this.subChapterSecSubSecContent = subChapterSecSubSecContent;
	}
	public List<SubChapterSecSubSubSec> getSubChapterSecSubSubSecList() {
		return subChapterSecSubSubSecList;
	}
	public void setSubChapterSecSubSubSecList(List<SubChapterSecSubSubSec> subChapterSecSubSubSecList) {
		this.subChapterSecSubSubSecList = subChapterSecSubSubSecList;
	}
	
		
}

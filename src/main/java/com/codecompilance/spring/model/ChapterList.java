package com.codecompilance.spring.model;

import java.util.List;

public class ChapterList {

	private int chapId;
	private String chapterId;
	private String chapterName;
	private String sectionName;
	private List<Chapter> sectionList;
	private List<SubChp> subChpList;
	
	public int getChapId() {
		return chapId;
	}
	public void setChapId(int chapId) {
		this.chapId = chapId;
	}
	public String getChapterId() {
		return chapterId;
	}
	public void setChapterId(String chapterId) {
		this.chapterId = chapterId;
	}
	public String getChapterName() {
		return chapterName;
	}
	public void setChapterName(String chapterName) {
		this.chapterName = chapterName;
	}
	public String getSectionName() {
		return sectionName;
	}
	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}
	public List<SubChp> getSubChpList() {
		return subChpList;
	}
	public void setSubChpList(List<SubChp> subChpList) {
		this.subChpList = subChpList;
	}
	public List<Chapter> getSectionList() {
		return sectionList;
	}
	public void setSectionList(List<Chapter> sectionList) {
		this.sectionList = sectionList;
	}

}

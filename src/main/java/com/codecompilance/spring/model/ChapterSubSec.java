package com.codecompilance.spring.model;

import java.util.List;

public class ChapterSubSec {
	private String chpName;
	private String chpTitle;
	private String userNote;
	private List<SubChpSec> subChpSecList;
	private String stateId;
	private String bookId;
	
	
	public String getStateId() {
		return stateId;
	}
	public void setStateId(String stateId) {
		this.stateId = stateId;
	}
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public String getChpName() {
		return chpName;
	}
	public void setChpName(String chpName) {
		this.chpName = chpName;
	}
	public String getChpTitle() {
		return chpTitle;
	}
	public void setChpTitle(String chpTitle) {
		this.chpTitle = chpTitle;
	}
	public String getUserNote() {
		return userNote;
	}
	public void setUserNote(String userNote) {
		this.userNote = userNote;
	}
	public List<SubChpSec> getSubChpSecList() {
		return subChpSecList;
	}
	public void setSubChpSecList(List<SubChpSec> subChpSecList) {
		this.subChpSecList = subChpSecList;
	}
	

}

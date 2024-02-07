package com.codecompilance.spring.model;

import java.util.List;

public class Chapter {
	private List<Chapter> chpterList;
	public List<Chapter> getChpterList() {
		return chpterList;
	}
	public void setChpterList(List<Chapter> chpterList) {
		this.chpterList = chpterList;
	}
	private int chapterId;
	private String chpName;
	private String chpTitle;
	private String userNote;
	private List<SubChp> subChpList;
	private int stateId;
	private int bookId;
	private String regionId;
	private int bookYear;
	private String bookName;
	private int subChapterId;
	private String subChapter;
	private String subChapterName;
	private String subChapterTitle;
	private String subChapterContent;
	private int subChapterSecId;
	private String subChapterSec;
	private String subChapterSecName;
	private String subChapterSecTitle;
	private String subChapterSecContent;
	private int subChapterSecSubSecId;
	private String subChapterSecSubSec;
	private String subChapterSecSubSecName;
	private String subChapterSecSubSecTitle;
	private String subChapterSecSubSecContent;
	private int subChapterSecSubSubSecId;
	private String subChapterSecSubSubSec;
	private String subChapterSecSubSubSecName;
	private String subChapterSecSubSubSecTitle;
	private String subChapterSecSubSubSecContent;
	private String state;
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getBookYear() {
		return bookYear;
	}
	public void setBookYear(int bookYear) {
		this.bookYear = bookYear;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public int getSubChapterId() {
		return subChapterId;
	}
	public void setSubChapterId(int subChapterId) {
		this.subChapterId = subChapterId;
	}
	public String getSubChapter() {
		return subChapter;
	}
	public void setSubChapter(String subChapter) {
		this.subChapter = subChapter;
	}
	public String getSubChapterName() {
		return subChapterName;
	}
	public void setSubChapterName(String subChapterName) {
		this.subChapterName = subChapterName;
	}
	public String getSubChapterContent() {
		return subChapterContent;
	}
	public void setSubChapterContent(String subChapterContent) {
		this.subChapterContent = subChapterContent;
	}
	public String getSubChapterTitle() {
		return subChapterTitle;
	}
	public void setSubChapterTitle(String subChapterTitle) {
		this.subChapterTitle = subChapterTitle;
	}
	public int getSubChapterSecId() {
		return subChapterSecId;
	}
	public void setSubChapterSecId(int subChapterSecId) {
		this.subChapterSecId = subChapterSecId;
	}
	public String getSubChapterSec() {
		return subChapterSec;
	}
	public void setSubChapterSec(String subChapterSec) {
		this.subChapterSec = subChapterSec;
	}
	public String getSubChapterSecName() {
		return subChapterSecName;
	}
	public void setSubChapterSecName(String subChapterSecName) {
		this.subChapterSecName = subChapterSecName;
	}
	public String getSubChapterSecTitle() {
		return subChapterSecTitle;
	}
	public void setSubChapterSecTitle(String subChapterSecTitle) {
		this.subChapterSecTitle = subChapterSecTitle;
	}
	public String getSubChapterSecContent() {
		return subChapterSecContent;
	}
	public void setSubChapterSecContent(String subChapterSecContent) {
		this.subChapterSecContent = subChapterSecContent;
	}
	public int getSubChapterSecSubSecId() {
		return subChapterSecSubSecId;
	}
	public void setSubChapterSecSubSecId(int subChapterSecSubSecId) {
		this.subChapterSecSubSecId = subChapterSecSubSecId;
	}
	public String getSubChapterSecSubSec() {
		return subChapterSecSubSec;
	}
	public void setSubChapterSecSubSec(String subChapterSecSubSec) {
		this.subChapterSecSubSec = subChapterSecSubSec;
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
	public int getSubChapterSecSubSubSecId() {
		return subChapterSecSubSubSecId;
	}
	public void setSubChapterSecSubSubSecId(int subChapterSecSubSubSecId) {
		this.subChapterSecSubSubSecId = subChapterSecSubSubSecId;
	}
	public String getSubChapterSecSubSubSec() {
		return subChapterSecSubSubSec;
	}
	public void setSubChapterSecSubSubSec(String subChapterSecSubSubSec) {
		this.subChapterSecSubSubSec = subChapterSecSubSubSec;
	}
	public String getSubChapterSecSubSubSecName() {
		return subChapterSecSubSubSecName;
	}
	public void setSubChapterSecSubSubSecName(String subChapterSecSubSubSecName) {
		this.subChapterSecSubSubSecName = subChapterSecSubSubSecName;
	}
	public String getSubChapterSecSubSubSecTitle() {
		return subChapterSecSubSubSecTitle;
	}
	public void setSubChapterSecSubSubSecTitle(String subChapterSecSubSubSecTitle) {
		this.subChapterSecSubSubSecTitle = subChapterSecSubSubSecTitle;
	}
	public String getSubChapterSecSubSubSecContent() {
		return subChapterSecSubSubSecContent;
	}
	public void setSubChapterSecSubSubSecContent(String subChapterSecSubSubSecContent) {
		this.subChapterSecSubSubSecContent = subChapterSecSubSubSecContent;
	}
	private List<ChapterSectionDetails> chapterSectionDetailsList;
	
	public int getChapterId() {
		return chapterId;
	}
	public void setChapterId(int chapterId) {
		this.chapterId = chapterId;
	}
	public String getRegionId() {
		return regionId;
	}
	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}
	public int getStateId() {
		return stateId;
	}
	public void setStateId(int stateId) {
		this.stateId = stateId;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getUserNote() {
		return userNote;
	}
	public void setUserNote(String userNote) {
		this.userNote = userNote;
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
	public List<SubChp> getSubChpList() {
		return subChpList;
	}
	public void setSubChpList(List<SubChp> subChpList) {
		this.subChpList = subChpList;
	}
	
	public List<ChapterSectionDetails> getChapterSectionDetailsList() {
		return chapterSectionDetailsList;
	}
	public void setChapterSectionDetailsList(List<ChapterSectionDetails> chapterSectionDetailsList) {
		this.chapterSectionDetailsList = chapterSectionDetailsList;
	}

}

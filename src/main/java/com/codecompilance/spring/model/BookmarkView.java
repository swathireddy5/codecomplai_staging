package com.codecompilance.spring.model;

import java.sql.Timestamp;

public class BookmarkView {
private int bookMarkId;
private String chapter;
private String section;
private String bookId;
private String stateId;
private int userId;
private String subSection;
private String subsubSection;
private String comments;
private String actionType;
private Timestamp createdTime;

public Timestamp getCreatedTime() {
	return createdTime;
}
public void setCreatedTime(Timestamp createdTime) {
	this.createdTime = createdTime;
}

public String getActionType() {
	return actionType;
}
public void setActionType(String actionType) {
	this.actionType = actionType;
}

public String getSubSection() {
	return subSection;
}
public void setSubSection(String subSection) {
	this.subSection = subSection;
}

public String getSubsubSection() {
	return subsubSection;
}
public void setSubsubSection(String subsubSection) {
	this.subsubSection = subsubSection;
}

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

public int getUserId() {
	return userId;
}
public void setUserId(int userId) {
	this.userId = userId;
}

public int getBookMarkId() {
	return bookMarkId;
}
public void setBookMarkId(int bookMarkId) {
	this.bookMarkId = bookMarkId;
}

public String getSection() {
	return section;
}
public void setSection(String section) {
	this.section = section;
}
public String getChapter() {
	return chapter;
}
public void setChapter(String chapter) {
	this.chapter = chapter;
}
public String getComments() {
	return comments;
}
public void setComments(String comments) {
	this.comments = comments;
}
}

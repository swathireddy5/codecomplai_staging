package com.codecompilance.spring.model;

import java.util.Date;

public class ProjectView {
private String projectName;
private String jurisdiction;
private int projectId;
private int userId;
private String codeYear;
private Date createdAt;

// building info fields
private String sprinklerType;
private String constructionType;
private String neworexistingbuild;
private String avgHeight;
private String heightOrArea;
private int movieTheatre;
private int entertainment;
private int conStructure;
private int extBalcony;
private int egressBalcony;
private int roofPortionOccupiable;
private int fireAlarm;

public Date getCreatedAt() {
	return createdAt;
}
public void setCreatedAt(Date createdAt) {
	this.createdAt = createdAt;
}

public String getProjectName() {
	return projectName;
}
public void setProjectName(String projectName) {
	this.projectName = projectName;
}

public int getProjectId() {
	return projectId;
}
public void setProjectId(int projectId) {
	this.projectId = projectId;
}
public int getUserId() {
	return userId;
}
public void setUserId(int userId) {
	this.userId = userId;
}
public String getJurisdiction() {
	return jurisdiction;
}
public void setJurisdiction(String jurisdiction) {
	this.jurisdiction = jurisdiction;
}
public String getCodeYear() {
	return codeYear;
}
public void setCodeYear(String codeYear) {
	this.codeYear = codeYear;
}

//building info fields

public String getSprinklerType() {
	return sprinklerType;
}
public void setSprinklerType(String sprinklerType) {
	this.sprinklerType = sprinklerType;
}
public String getConstructionType() {
	return constructionType;
}
public void setconstructionType(String constructionType) {
	this.constructionType = constructionType;
}
public String getNeworexistingbuild() {
	return neworexistingbuild;
}
public void setNeworexistingbuild(String neworexistingbuild) {
	this.neworexistingbuild = neworexistingbuild;
}
public String getAvgHeight() {
	return avgHeight;
}
public void setAvgHeight(String avgHeight) {
	this.avgHeight = avgHeight;
}
public String getHeightOrArea() {
	return heightOrArea;
}
public void setHeightOrArea(String heightOrArea) {
	this.heightOrArea = heightOrArea;
}
public int getMovieTheatre() {
	return movieTheatre;
}
public void setMovieTheatre(int movieTheatre) {
	this.movieTheatre = movieTheatre;
}
public int getEntertainment() {
	return entertainment;
}
public void setEntertainment(int entertainment) {
	this.entertainment = entertainment;
}
public int getConStructure() {
	return conStructure;
}
public void setConStructure(int conStructure) {
	this.conStructure = conStructure;
}
public int getExtBalcony() {
	return extBalcony;
}
public void setExtBalcony(int extBalcony) {
	this.extBalcony = extBalcony;
}
public int getEgressBalcony() {
	return egressBalcony;
}
public void setEgressBalcony(int egressBalcony) {
	this.egressBalcony = egressBalcony;
}
public int getRoofPortionOccupiable() {
	return roofPortionOccupiable;
}
public void setRoofPortionOccupiable(int roofPortionOccupiable) {
	this.roofPortionOccupiable = roofPortionOccupiable;
}
public int getFireAlarm() {
	return fireAlarm;
}
public void setFireAlarm(int fireAlarm) {
	this.fireAlarm = fireAlarm;
}

}

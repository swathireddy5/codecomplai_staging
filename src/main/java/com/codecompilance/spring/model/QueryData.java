package com.codecompilance.spring.model;

public class QueryData {
	private String query;
	private String state;
	private String collection_name;
	private String location;

    public QueryData(String query, String state, String collection_name, String location) {
        this.query = query;
        this.state = state;
        this.collection_name = collection_name;
        this.location = location;
    }
	public String getQuery() {
		return query;
	}
	
	public void setQuery(String query) {
		this.query = query;
	}
	
	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	
	public String getCollectionName() {
		return collection_name;
	}
	
	public void setCollectionName(String collection_name) {
		this.collection_name = collection_name;
	}
	
	public String getLocation() {
		return location;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}
}

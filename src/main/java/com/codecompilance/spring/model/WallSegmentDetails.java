package com.codecompilance.spring.model;

public class WallSegmentDetails {
	private String wallSegment;
	private String length;
	private String wallFace;
	private String wallDistFrom;
	private String wallDistTo;
	private int partyWall;
	
	public String getWallSegment() {
		return wallSegment;
	}
	public void setWallSegment(String wallSegment) {
		this.wallSegment = wallSegment;
	}
	public String getLength() {
		return length;
	}
	public void setLength(String length) {
		this.length = length;
	}
	public String getWallFace() {
		return wallFace;
	}
	public void setWallFace(String wallFace) {
		this.wallFace = wallFace;
	}
	public String getWallDistFrom() {
		return wallDistFrom;
	}
	public void setWallDistFrom(String wallDistFrom) {
		this.wallDistFrom = wallDistFrom;
	}
	public String getWallDistTo() {
		return wallDistTo;
	}
	public void setWallDistTo(String wallDistTo) {
		this.wallDistTo = wallDistTo;
	}
	public int getPartyWall() {
		return partyWall;
	}
	public void setPartyWall(int partyWall) {
		this.partyWall = partyWall;
	}
}

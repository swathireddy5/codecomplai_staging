package com.codecompilance.spring.model;

public class BuildingComposition {
		    
		    private String floor;
			private String storyHeight;
			private String spaceName;
			private String occupancy;
			private String functionOfSpace;
			private String gross;
			private String netOccupaintLoad;
			private String nextComponentWithPath;
			private String type;
			private String corridor;
			private String corridorSpace;
			private String stairway;
			private String exit;
			
			public BuildingComposition() {}
			public BuildingComposition(String floor, String storyHeight, String spaceName, String occupancy, String functionOfSpace, String gross, String netOccupaintLoad, String nextComponentWithPath,String type) {
				this.floor = floor;
				this.storyHeight = storyHeight;
				this.spaceName = spaceName;
				this.occupancy = occupancy;
				this.functionOfSpace = functionOfSpace;
				this.gross = gross;
				this.netOccupaintLoad = netOccupaintLoad;
				this.nextComponentWithPath = nextComponentWithPath;
				this.type = type;
			}
			
			public String getType() {
				return type;
			}
			public void setType(String type) {
				this.type = type;
			}
			public String getFloor() {
				return floor;
			}
			public void setFloor(String floor) {
				this.floor = floor;
			}
			public String getStoryHeight() {
				return storyHeight;
			}
			public void setStoryHeight(String storyHeight) {
				this.storyHeight = storyHeight;
			}
			public String getSpaceName() {
				return spaceName;
			}
			public void setSpaceName(String spaceName) {
				this.spaceName = spaceName;
			}
			public String getOccupancy() {
				return occupancy;
			}
			public void setOccupancy(String occupancy) {
				this.occupancy = occupancy;
			}
			public String getFunctionOfSpace() {
				return functionOfSpace;
			}
			public void setFunctionOfSpace(String functionOfSpace) {
				this.functionOfSpace = functionOfSpace;
			}
			public String getGross() {
				return gross;
			}
			public void setGross(String gross) {
				this.gross = gross;
			}
			public String getNetOccupaintLoad() {
				return netOccupaintLoad;
			}
			public void setNetOccupaintLoad(String netOccupaintLoad) {
				this.netOccupaintLoad = netOccupaintLoad;
			}
			public String getNextComponentWithPath() {
				return nextComponentWithPath;
			}
			public void setNextComponentWithPath(String nextComponentWithPath) {
				this.nextComponentWithPath = nextComponentWithPath;
			}
			public String getCorridor() {
				return corridor;
			}
			public void setCorridor(String corridor) {
				this.corridor = corridor;
			}
			public String getCorridorSpace() {
				return corridorSpace;
			}
			public void setCorridorSpace(String corridorSpace) {
				this.corridorSpace = corridorSpace;
			}
			public String getStairway() {
				return stairway;
			}
			public void setStairway(String stairway) {
				this.stairway = stairway;
			}
			public String getExit() {
				return exit;
			}
			public void setExit(String exit) {
				this.exit = exit;
			}
}

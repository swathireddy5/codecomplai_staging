package com.codecompilance.spring.model;

public class ChapterDetails implements Comparable<ChapterDetails>{
	private String chapterName;
	private String chapterUrl;
//	private String chapterTitle;	
//	private String chapterContent;
	
	/*
	 * public String getChapterTitle() { return chapterTitle; } public void
	 * setChapterTitle(String chapterTitle) { this.chapterTitle = chapterTitle; }
	 */
	public String getChapterName() {
		return chapterName;
	}
	public void setChapterName(String chapterName) {
		this.chapterName = chapterName;
	}
	public String getChapterUrl() {
		return chapterUrl;
	}
	public void setChapterUrl(String chapterUrl) {
		this.chapterUrl = chapterUrl;
	}

	/*
	 * public String getChapterContent() { return chapterContent; } public void
	 * setChapterContent(String chapterContent) { this.chapterContent =
	 * chapterContent; }
	 */
	@Override
	public int compareTo(ChapterDetails chpDet) {
		
		String chpName1 = this.getChapterName().toUpperCase();
		   String chpName2 = chpDet.getChapterName().toUpperCase();

		   //ascending order
		   return chpName1.compareTo(chpName2);
	}
	

}

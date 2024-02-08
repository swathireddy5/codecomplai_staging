package com.codecompilance.spring.controller;


import java.util.Properties;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.codecompilance.spring.model.Book;
import com.codecompilance.spring.model.Chapter;

@Controller
public class BookController {
	private static final Logger logger = Logger.getLogger(HomeController.class);
	Properties prop = new Properties();
	InputStream inputStream;
	String propFileName = "dbconnection.properties";
	
//	This method is used to get book details for the given stateId and region Id
	@RequestMapping(value = "/getBookDetails", method = RequestMethod.GET)
	public String getBookDetails(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		
		HashMap<String, Integer> chpList = new HashMap<String, Integer>();
		String regionName = request.getParameter("regionName");
		String bookUrl = request.getParameter("bookUrl");
		int state_Id = Integer.parseInt(request.getParameter("stateId"));
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		List<Chapter> chapterContentList = new ArrayList<Chapter>();
		
		session.setAttribute("selectedRegionId", regionName);
		session.setAttribute("selectedBookUrl", bookUrl);
		session.setAttribute("selectedBookTitle", bookUrl);
		session.setAttribute("selectedStateId", state_Id);
		session.setAttribute("selectedBookId", bookId);
		
		try {
			chpList = getChaptersList(request, response, bookId, state_Id);
			String chapterView = getChapterDetails(request, response, bookId, state_Id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("chpList", chpList);
		System.out.println("chpList-->"+chpList);
		//response.sendRedirect("ChapterView");
		return "ChapterView";
	}
	
	public HashMap<String, Integer> getChaptersList(HttpServletRequest request, HttpServletResponse response, int bookId, int stateId) {
		HashMap<String, Integer> chapSecMap = new LinkedHashMap<String, Integer>();
		ArrayList<String> chapterNamesList = new ArrayList<String>();
		Statement st = null;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = DBConnect.connect();
			if (conn != null) {
	            st = conn.createStatement();
	            String sql = "select chps.id as chapterId, chps.chapter_name, chps.chapter_title from tblchapters chps where "
	            		+ "chps.book_id = "+bookId+" and chps.chapter_name is not null order by chps.sequence;";
	            
	            rs = st.executeQuery(sql);
	            while (rs.next()) {
	            	StringBuilder chaptid = new StringBuilder();
	            	int chpId = rs.getInt("chapterId");
	            	chaptid.append(chpId);
	            	chaptid.append("__");
	            	chapterNamesList.add(chaptid+rs.getString("chapter_title"));
	            	chapSecMap.put(rs.getInt("chapterId")+"-"+rs.getString("chapter_title").toUpperCase(), rs.getInt("chapterId"));
	            }
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("Chapters List --->"+chapSecMap);
		return chapSecMap;
	}

//	This will return Chapter details of selected chapter
	  @RequestMapping(value = "/getChapterDetails", method = RequestMethod.GET)
	  public String getChapterDetails(HttpServletRequest request, HttpServletResponse response, int bookId, int stateId) 
	  {
		  HttpSession session = request.getSession();
		  JSONObject outputJsonObj = new JSONObject(); 
		  List<Chapter> chapterList = new ArrayList<Chapter>();
		  Chapter chapter = new Chapter();
		  ArrayList<String> sectionDetailsList = new ArrayList<String>();
		  Connection conn = null;
		  Statement st = null;
		  ResultSet rs = null;
		  try 
		  {
			  conn = DBConnect.connect();
			  if (conn != null) {
				  st =(Statement) conn.createStatement();
				  /*String sql = "select sts.id as stateId, sts.state_name as State, bks.id as bookId, bks.book_title , chps.id as chapterId, chps.chapter_title, "
				  		+ "chps.chapter_name, subchps.id as subchapterId, subchps.subchapter_title, sbchsec.id as subchaptersecid, sbchsec.subchaptersection_title, sbchsec.subchaptersection_content, "
				  		+ "tblsbchsbsec.id as sbchpsecsubsecid, tblsbchsbsec.subchaptersubsection_content, tblsbchsbsec.subchaptersubsection_title from tblsubchapterssubsections \r\n" + 
				  		"tblsbchsbsec left join tblsubchaptersections sbchsec on tblsbchsbsec.subchaptersection_id = sbchsec.id left \r\n" + 
				  		"join tblsubchapters subchps on sbchsec.subchapter_id = subchps.id left join tblchapters chps on subchps.chapter_id = chps.id left join tblbooks bks on \r\n" + 
				  		"chps.book_id = bks.id left join tblstates sts on bks.state_id = sts.id and \r\n" +
				  		"sts.state_name = '"+stateId+"' and bks.book_title = '"+bookName+"' and chps.chapter_title = '"+chaptId+"' where bks.id is not null and sts.state_name is not null;";
					*/
				  String sql = "select distinct chps.id as chapterId, sts.id as stateId, sts.state_name as State, bks.id as bookId, chps.sequence, chps.chapter_title, chps.chapter_name, "
				  		+ "subchps.id as subchapterId, subchps.subchapter_title, subchps.subchapter_content, sbchsec.id as subchaptersecid, sbchsec.subchapter_id, sbchsec.subchaptersection_no, \r\n" + 
						"sbchsec.subchaptersection_title, sbchsec.subchaptersection_content, tblsbchsbsec.id as sbchpsecsubsecid, tblsbchsbsec.subchaptersubsection_content,"
						+ " tblsbchsbsec.subchaptersubsection_title, tblsbchsbsbsec.id as sbchpsbsbsecId, tblsbchsbsbsec.subchaptersubsubsection_title, tblsbchsbsbsec.subchaptersubsubsection_content "
						+ "from tblsubchapterssubsubsections tblsbchsbsbsec left join tblsubchapterssubsections tblsbchsbsec on tblsbchsbsbsec.subchaptersubsection_id = tblsbchsbsec.id \r\n" + 
						" left join tblsubchaptersections sbchsec on tblsbchsbsec.subchaptersection_id = sbchsec.id left join tblsubchapters subchps on "
						+ "sbchsec.subchapter_id = subchps.id left join tblchapters chps on subchps.chapter_id = chps.id left join tblbooks bks on \r\n" + 
						"chps.book_id = bks.id left join tblstates sts on bks.state_id = sts.id and sts.id = "+stateId+" and bks.id = "+bookId+" and "
						+ "chps.id = subchps.chapter_id where bks.id is not null and sts.id is not null and chps.id is not null "
						+ "order by chps.sequence, tblsbchsbsec.id, tblsbchsbsbsec.id;";
					
					
					rs=st.executeQuery(sql);
		            while (rs.next()) {
		            	chapter = new Chapter();
		            	chapter.setStateId(rs.getInt("stateId"));
		            	chapter.setState(rs.getString("State"));
		            	chapter.setBookId(rs.getInt("bookId"));
		            	chapter.setChapterId(rs.getInt("chapterId"));
		            	chapter.setChpName(rs.getString("chapter_name"));
		            	chapter.setChpTitle(rs.getString("chapter_title"));
		            	chapter.setSubChapterId(rs.getInt("subchapterId"));
		            	chapter.setSubChapterTitle(rs.getString("subchapter_title"));
		            	chapter.setSubChapterContent(rs.getString("subchapter_content"));
		            	chapter.setSubChapterSecId(rs.getInt("subchaptersecid"));
		            	chapter.setSubChapterSecName(rs.getString("subchaptersection_no"));
		            	chapter.setSubChapterSecTitle(rs.getString("subchaptersection_title"));
		            	chapter.setSubChapterSecContent(rs.getString("subchaptersection_content"));
		            	chapter.setSubChapterSecSubSecId(rs.getInt("sbchpsecsubsecid"));
		            	chapter.setSubChapterSecSubSecTitle(rs.getString("subchaptersubsection_title"));
		            	chapter.setSubChapterSecSubSecContent(rs.getString("subchaptersubsection_content"));
		            	chapter.setSubChapterSecSubSubSecId(rs.getInt("sbchpsbsbsecId"));
		            	chapter.setSubChapterSecSubSubSecTitle(rs.getString("subchaptersubsubsection_title"));
		            	chapter.setSubChapterSecSubSubSecContent(rs.getString("subchaptersubsubsection_content"));
		            	chapterList.add(chapter);
		            	//sectionDetailsList.add(rs.getInt("subchapterId")+"_"+rs.getString("subchapter_title"));
		            }
				}
			  
		  }catch (SQLException sqe) {
			  sqe.printStackTrace();
		  }catch (Exception e) {
			  e.printStackTrace();
		  }finally {
				try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			//System.out.println("sectionDetailsList"+sectionDetailsList);
			session.setAttribute("chapterList", chapterList);
		    System.out.println("chapterList -->"+chapterList);
		    //session.setAttribute("sectionDetailsList", sectionDetailsList);
		    return "ChapterView";
	}
	  
	  
//		This will return section details of selected chapter id
		  @RequestMapping(value = "/getSectionDetails", method = RequestMethod.GET)
		  public @ResponseBody String getSectionDetails(@RequestParam String chapterId, HttpServletRequest request, HttpServletResponse response)
		  {
			  HttpSession session = request.getSession();
			  int chaptId = Integer.parseInt(request.getParameter("chapterId"));
			  int sectionId = 0;
			  if(request.getParameter("sectionId") != null && request.getParameter("sectionId") !="") {
				  sectionId = Integer.parseInt(request.getParameter("sectionId"));
			  }
			  System.out.println("===========chapterId=========="+chaptId);
			  System.out.println("===========sectionId=========="+sectionId);
			  JSONArray sectionDetailsList = new JSONArray();
			  if(chaptId != 0) {
				  Connection conn = null;
				  Statement st = null;
				  ResultSet rs = null;
				  try
				  {
					  conn = DBConnect.connect();
					  if (conn != null) {
						  st =(Statement) conn.createStatement();
				          
						  String sql = "select id, subchapter_title from tblsubchapters where chapter_id = "+chaptId+" and subchapter_title is not null";
							
							rs=st.executeQuery(sql);
				            while (rs.next()) {
				            	JSONObject obj = new JSONObject();
				            	obj.put("subchapter_id", rs.getInt("id"));
				            	obj.putOnce("subchapter_title", rs.getString("subchapter_title"));
				            	sectionDetailsList.put(obj);
				            }
						}
					  
					 /* if(sectionId != 0) {
						  chapterList = getSubSectionDetails(request, response, chaptId, sectionId);
						  if(!chapterList.isEmpty()) {
							  session.setAttribute("chapterList", chapterList);
							  //session.setAttribute("chpList", chapterList);
						  }
					  } */
					  
				  }catch (SQLException sqe) {
					  sqe.printStackTrace();
				  }catch (Exception e) {
					  e.printStackTrace();
				  }finally {
						try {
							rs.close();
							st.close();
							conn.close();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				  System.out.println("sectionDetailsList"+sectionDetailsList);
			  }
			  session.setAttribute("sectionDetailsList", sectionDetailsList);
			  return sectionDetailsList.toString();
			  //return "ChapterView";
	}


}